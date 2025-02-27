import pickle
from sklearn.ensemble import RandomForestClassifier
import numpy as np
import os
import traceback

print("🚀 Script started...")  # Debugging start message

try:
    # Generate random training data
    print("✅ Generating training data...")
    X_train = np.random.rand(100, 5)  # 100 samples, 5 features
    y_train = np.random.randint(0, 2, 100)  # Binary classification (0 or 1)

    print("✅ Training the model...")
    model = RandomForestClassifier()
    model.fit(X_train, y_train)

    # Get full path for saving the model
    file_path = os.path.join(os.getcwd(), "random_forest_model.pkl")

    print(f"✅ Saving model to: {file_path}...")
    with open(file_path, 'wb') as file:
        pickle.dump(model, file)

    print("✅ Model saved successfully!")

except Exception as e:
    print("❌ ERROR OCCURRED!")
    print(traceback.format_exc())  # Print full error traceback
