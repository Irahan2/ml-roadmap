from flask import Flask, render_template, request, jsonify
from transformers import pipeline, AutoTokenizer, AutoModelForCausalLM
import torch

app = Flask(__name__)

print("Loading model...")
model_name = "distilgpt2"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name)

if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

print("Model loaded!")

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/chat', methods=['POST'])
def chat():
    try:
        user_message = request.json.get('message', '')
        
        if not user_message:
            return jsonify({'response': 'Please enter a message.'})
        
        # Prepare user message for the model
        prompt = f"User: {user_message}\nBot:"
        
        # Tokenize
        inputs = tokenizer.encode(prompt, return_tensors='pt', max_length=512, truncation=True)
        
        # Generate response with model
        with torch.no_grad():
            outputs = model.generate(
                inputs,
                max_length=inputs.shape[1] + 50,  # Maksimum 50 token daha ekle
                num_return_sequences=1,
                temperature=0.7,
                do_sample=True,
                pad_token_id=tokenizer.eos_token_id,
                eos_token_id=tokenizer.eos_token_id
            )
        
        # Decode response
        response = tokenizer.decode(outputs[0], skip_special_tokens=True)
        
        # Extract only bot response
        if "Bot:" in response:
            bot_response = response.split("Bot:")[-1].strip()
        else:
            bot_response = "Sorry, I didn't understand. Can you say something else?"
        
        return jsonify({'response': bot_response})
        
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'response': 'An error occurred. Please try again.'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
