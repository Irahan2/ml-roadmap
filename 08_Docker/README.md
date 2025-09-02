\# 🤖 Simple Chatbot with Docker



This project is a simple chatbot built with \*\*Flask\*\* and \*\*HuggingFace Transformers\*\*.

It provides a minimal web interface where users can send messages and get instant replies.



---



\## 🐳 What is Docker?



\*\*Docker\*\* is a platform that lets you run software inside \*\*portable containers\*\*.



\* A container = a small package that includes the app + its dependencies + environment settings.

\* This solves the “it works on my machine but not on yours” problem.

\* Applications run the same way across Windows, Linux, and macOS.



\### Container vs Virtual Machine (VM)



\* \*\*VM:\*\* Emulates an entire operating system → heavy, slow to boot.

\* \*\*Container:\*\* Isolates only what’s needed for the app → lightweight, fast, resource-efficient.



👉 In short: Docker = \*\*a guarantee your app runs the same everywhere\*\*.



---



\## 🚀 Why Docker?



\* One-command setup \& execution

\* Portability across environments

\* Isolated runtime

\* No dependency/version conflicts



---



\## 📂 Project Structure



```

├── app.py             # Flask backend - chatbot API

├── index.html         # Minimal frontend UI

├── requirements.txt   # Python dependencies

├── Dockerfile         # Instructions to build Docker image

└── README.md          # This file

```



---



\## ⚙️ Setup (with Docker)



1\. \*\*Build the Docker image:\*\*



&nbsp;  ```bash

&nbsp;  docker build -t simple-chatbot .

&nbsp;  ```



2\. \*\*Run the container:\*\*



&nbsp;  ```bash

&nbsp;  docker run -p 5000:5000 simple-chatbot

&nbsp;  ```



3\. \*\*Open in browser:\*\*



&nbsp;  ```

&nbsp;  http://localhost:5000

&nbsp;  ```



---



\## 🔧 Setup (without Docker)



```bash

pip install -r requirements.txt

python app.py

```



Then visit `http://localhost:5000`.



---



\## 🧠 Tech Stack



\* \[Flask](https://flask.palletsprojects.com/) – Web framework

\* \[HuggingFace Transformers](https://huggingface.co/transformers/) – Language model (distilgpt2)

\* \[PyTorch](https://pytorch.org/) – Model backend



---



