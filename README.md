# **TruthTrack: AI Vigilance for Reliable Information**

## Overview
TruthTrack provides a system for analyzing news article headlines by predicting their primary topic, identifying subtopics, and calculating similarity with other related headlines. The application is built using machine learning models for topic prediction and semantic similarity, integrated with Custom Search for fetching related headlines.

## Features
1. **Topic Prediction**: Predicts the most representative word for the topic of a news headline along with relevant subtopics using NMF (Non-Negative Matrix Factorization) and TF-IDF.
2. **Similarity Analysis**: Calculates similarity scores between the input headline and other headlines using multiple methods:
   - Cosine Similarity (TF-IDF)
   - Levenshtein Similarity
   - Semantic Matching (Sentence Transformers)
3. **Custom Search Integration**: Fetches top 5 related headlines from the web using the Custom Search API.
4. **Combined Similarity Score**: Aggregates similarity scores using the harmonic mean for better relevance analysis.
5. **Web Application**: A Flask-based user interface for interacting with the system.

---

## Tech Stack
- **Backend**: Python, Flask
- **Machine Learning**:
  - **Topic Prediction**: TF-IDF, NMF (via `sklearn`)
  - **Semantic Similarity**: Sentence Transformers (`all-MiniLM-L6-v2`)
  - **Natural Languange Processing (NLP)**
- **Frontend**: HTML, CSS (via Flask templates)
- **Libraries**:
  - `numpy`, `scikit-learn`, `sentence-transformers`, `difflib`, `httpx`

---

## Installation and Setup

### Prerequisites
- Python 3.8 or above
- Custom Search API credentials (API Key and Search Engine ID)

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/murtaza-sadri-19/TruthTrack.git
   cd TruthTrack
   ```

2. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   pip install sentence-transformers==3.3.1
   pip install flask
   ```

3. **Run the Application**:
   ```bash
   python App.py
   ```

4. **Access the Application**:
   Open your browser and navigate to `http://127.0.0.1:5000/`.

---

## File Structure
```
news-topic-prediction/
|-- App.py                # Main Flask application
|-- Prediction.py         # Topic prediction logic
|-- similarity.py         # Similarity calculation methods
|-- templates/
|   |-- index.html        # Home page template
|   |-- main.html         # Result and interaction page template
|-- News Proto/
|   |-- tfidf_vectorizer.pkl # Pre-trained TF-IDF vectorizer
|   |-- nmf_model.pkl        # Pre-trained NMF model
|-- static/               # CSS/JS files (if applicable)
|-- requirements.txt      # Python dependencies
|-- README.md             # Project documentation
```

---

## Usage
1. **Home Page**:
   - Navigate to the home page and input your news headline.

2. **Prediction and Results**:
   - After submitting, the system predicts the primary topic and subtopics of the headline.
   - Displays top 5 related headlines from World-Wide Searches.
   - Shows detailed similarity scores for each headline, along with a combined similarity score.

---

## Key Components

### Prediction
- **`Prediction.py`**:
  - Preprocesses the text (lowercasing, splitting).
  - Uses TF-IDF vectorizer and NMF model to predict topics and extract the top words.

### Similarity Analysis
- **`similarity.py`**:
  - Calculates:
    - Cosine similarity using TF-IDF.
    - Levenshtein similarity using `SequenceMatcher`.
    - Semantic similarity using `sentence-transformers`.
  - Combines these scores using a harmonic mean for better accuracy.

### Search Integration
- **`Search` function in `App.py`**:
  - Fetches related headlines using Custom Search.

---

## Example Output
### Input
**Headline**: *"Rohit Sharma, Virat Kohli announce retirement from T20 after world cup."*

### Output
**Predicted Topic**: *"cricket"*  
**Subtopics**: *"retirement, players"*

**Top 5 Related Headlines**:
1. Title: "Virat Kohli announces retirement from cricket."  
   URL: *https://example.com/article1*
2. Title: "Rohit Sharma speaks on retirement plans."  
   URL: *https://example.com/article2*

**Similarity Scores**:
- Cosine Similarity (TF-IDF): 0.85
- Levenshtein Similarity: 0.90
- Semantic Similarity (BERT): 0.88

**Combined Score**: 0.87

---

## Future Enhancements
1. Extend topic prediction to support multi-label classification.
2. Add support for more languages.
3. Improve UI/UX for better user interaction.
4. Enhance Custom Search integration with additional filters.

---

©2025 GS Geeks & Bits. All rights reserved.
