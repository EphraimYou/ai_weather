import os
from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

# Get full path to the model file
file_path = os.path.join(os.getcwd(), "random_forest_model.pkl")

# Check if the file exists
if not os.path.exists(file_path):
    raise FileNotFoundError(f"Model file not found at: {file_path}")

# Load the model
with open(file_path, 'rb') as file:
    model = pickle.load(file)

@app.route('/')
def home():
    return "Welcome Ephraim to the ML Prediction API!"

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    features = np.array(data['features']).reshape(1, -1)
    prediction = model.predict(features)
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
