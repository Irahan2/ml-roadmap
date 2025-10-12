Fake News Prediction Project

This project aims to build a machine learning model that can classify news articles as either real or fake based on their text content.

📌 About the Dataset

The dataset used for this project contains news articles with the following key features:

id: A unique identifier for each article.

title: The title of the news article.

author: The author of the article.

text: The full content of the article.

label: The target variable, indicating whether the news is real (0) or fake (1).

💻 Project Status: In Progress

The project is currently incomplete. During the prediction phase, I encountered a NotFittedError, which indicates that the TfidfVectorizer was not properly trained on the dataset before being used to transform the text.

This means the model wasn't able to understand the text to make a prediction.

✅ Next Steps

Resolve the Error: Correctly fit the TfidfVectorizer on the training data.

Complete Model Training: Train the classifier on the prepared data.

Perform Evaluation: Evaluate the model's performance and analyze the results.

Once these steps are completed, I will update the repository with a detailed analysis and the final results of the prediction model.
