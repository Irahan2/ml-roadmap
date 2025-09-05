import os
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_openai import ChatOpenAI
from dotenv import load_dotenv, find_dotenv
from fastapi import FastAPI
from langserve import add_routes
import uvicorn

# Load OpenAI API key from .env file
_ = load_dotenv(find_dotenv())
openai_api_key = os.environ["OPENAI_API_KEY"]

# LLM and parser
llm = ChatOpenAI(model="gpt-3.5-turbo")
parser = StrOutputParser()

# Prompt definition
system_template = "Translate the following into {language}:"
prompt_template = ChatPromptTemplate.from_messages([
    ("system", system_template),
    ("user", "{text}")
])

# Chain (prompt → llm → parser)
chain = prompt_template | llm | parser

# FastAPI application
app = FastAPI(
    title="simpleTranslator",
    version="1.0",
    description="A simple API server using LangChain's Runnable interfaces",
)

# Add route
add_routes(
    app,
    chain,
    path="/chain",
)

# Run server
if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8000)
