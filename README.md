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
6. **Mobile Application**: A Mobile Application created in Flutter interacting with the system.
7. **Chrome Extention**: A Extenstion directly integrating with the system. 

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

3. **Run the Web-Application**:
   ```bash
   python App.py
   ```

4. **Access the Web-Application**:
   Open your browser and navigate to `http://127.0.0.1:5000/`.

---

## File Structure
```
murtaza-sadri-19-TruthTrack/
├── README.md                              # Main documentation for the project
├── News_Topic_.ipynb                      # Jupyter notebook for news topic analysis
├── Prediction.py                          # Python script for prediction-related functionalities
├── app.py                                 # Flask backend for the application
├── demo.py                                # Script to demonstrate the working of the application
├── requirements.txt                       # List of Python dependencies for the project
├── similarity.py                          # Script for computing similarity between news articles
├── Dataset/                               # Directory containing datasets and scrapers
│   ├── Web_Scrapping_Snopes.csv           # CSV dataset scraped from Snopes
│   ├── Web_Scrapping_factcheck.csv        # CSV dataset scraped from fact-checking sites
│   ├── cricket.ipynb                      # Notebook analyzing cricket-related news
│   ├── PolitiFact/                        # Subdirectory for PolitiFact-related datasets
│   │   ├── FactChecker_Dataset.csv        # Dataset from PolitiFact for fact-checking
│   │   └── ScrapCode.ipynb                # Scraper for PolitiFact data
│   └── TheHinduCricket/                   # Subdirectory for cricket news from The Hindu
│       ├── Web_Scraping.ipynb             # Notebook for scraping cricket news from The Hindu
│       └── Web_Scrapping_Hindu.csv        # CSV dataset scraped from The Hindu cricket section
├── News Proto/                            # Directory for prototype models and related files
│   ├── PAM based model.ipynb              # Notebook for PAM-based model experimentation
│   ├── news.csv                           # CSV file for news data
│   ├── news.tsv                           # TSV file for news data
│   ├── news.zip                           # Compressed file containing news datasets
│   ├── nmf_model.pkl                      # Saved NMF model for topic modeling
│   ├── nmf_model_params.json              # Parameters for the NMF model
│   └── tfidf_vectorizer.pkl               # TF-IDF vectorizer used in topic modeling
├── News Topic/                            # Directory for topic modeling and analysis
│   ├── News_Topic.ipynb                   # Jupyter notebook for analyzing news topics
│   ├── News_Topic.md                      # Documentation for the news topic analysis
│   ├── News_Topic_.ipynb                  # Duplicate or updated notebook for news topics
│   ├── Similarity_news.ipynb              # Notebook for calculating similarity between topics
│   ├── categorized_news.zip               # Compressed file containing categorized news
│   ├── lda_dictionary.txt                 # Dictionary used in LDA modeling
│   ├── lda_model.json                     # JSON representation of the LDA model
│   ├── lda_model.model                    # Binary representation of the trained LDA model
│   ├── lda_model.model.expElogbeta.npy    # LDA model's beta matrix (numpy format)
│   ├── lda_model.model.id2word            # Mapping of IDs to words for the LDA model
│   ├── lda_model.model.state              # State of the trained LDA model
│   ├── lda_model1.json                    # Another JSON representation of an LDA model
│   ├── news_topic.zip                     # Compressed file containing topic-related data
│   └── .idea/                             # IDE-specific metadata (optional to include)
├── templates/                             # Frontend HTML templates for the web app
│   ├── index.html                         # Main page template
│   └── main.html                          # Additional template for the web app
└── truthtell_extension/                   # Chrome extension for TruthTrack
    ├── README.md                          # Documentation for the extension
    ├── background.js                      # Background script for the Chrome extension
    ├── content.js                         # Content script for interacting with web pages
    ├── manifest.json                      # Manifest file defining the Chrome extension
    ├── popup.html                         # HTML for the popup interface of the extension
    ├── popup.js                           # JavaScript for the popup's functionality
    └── icons/                             # Icons used for the Chrome extension
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
