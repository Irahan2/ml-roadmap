import os
from dotenv import load_dotenv,find_dotenv
_ = load_dotenv(find_dotenv())
openai_api_key = os.environ["OPENAI_API_KEY"]

# Completion model

from langchain_openai import OpenAI

llmModel = OpenAI()


for chunk in llmModel.stream(
  " What  is OpenAI , I need detailed response?"  
):
    print(chunk, end="", flush=True)