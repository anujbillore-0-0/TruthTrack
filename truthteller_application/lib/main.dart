import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PredictionPage(),
    );
  }
}

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final TextEditingController _headlineController = TextEditingController();
  String _predictionText = "";
  List<Map<String, dynamic>> _similarHeadlines = [];
  bool _isLoading = false;
  String _error = "";

  // Function to handle form submission
  Future<void> _submitHeadline(String headline) async {
    setState(() {
      _isLoading = true;
      _predictionText = "";
      _similarHeadlines.clear();
      _error = "";
    });

    // Simulating API call to the server
    try {
      final response = await http.post(
        Uri.parse(
            'https://your-flask-api-url/prediction'), // Replace with your API URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'chatInput': headline}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Parsing the response
        setState(() {
          _predictionText = data['prediction_text'] ?? "";
          _similarHeadlines =
              List<Map<String, dynamic>>.from(data['similar_headlines'] ?? []);
        });
      } else {
        setState(() {
          _error = 'Failed to fetch prediction.';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Truthtrack"),
        actions: [
          IconButton(
            icon: Icon(Icons.light_mode),
            onPressed: () {
              // Add theme toggle functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News headline input form
            TextField(
              controller: _headlineController,
              decoration: InputDecoration(
                hintText: "Type the news headline...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.article),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: () {
                if (_headlineController.text.isNotEmpty) {
                  _submitHeadline(_headlineController.text);
                }
              },
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Send Headline'),
            ),
            SizedBox(height: 20),
            // Error message display
            if (_error.isNotEmpty)
              Text(
                _error,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            // Prediction result
            if (_predictionText.isNotEmpty) ...[
              Text('Prediction Result:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_predictionText),
              SizedBox(height: 20),
              Text('Similar Headlines:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ..._similarHeadlines.map((item) {
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Cosine Similarity (TF-IDF): ${item['cosine_similarity_tfidf']}'),
                      Text(
                          'Levenshtein Similarity: ${item['levenshtein_similarity']}'),
                      Text(
                          'Cosine Similarity (BERT): ${item['cosine_similarity_bert']}'),
                      Text('Harmonic Mean: ${item['harmonic_mean']}'),
                    ],
                  ),
                );
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }
}
