import numpy as np
import matplotlib.pyplot as plt
from sklearn.datasets import make_classification
from sklearn.tree import DecisionTreeClassifier, plot_tree, export_text
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
X, y = make_classification(
    n_samples=1000,
    n_features=5,
    n_informative=3,
    n_redundant=0,
    n_classes=2,
    n_clusters_per_class=1,
    flip_y=0.1,
    random_state=42
)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)
model = DecisionTreeClassifier(criterion='entropy', max_depth=3)
model.fit(X_train, y_train)
train_acc = accuracy_score(y_train, model.predict(X_train))
test_acc = accuracy_score(y_test, model.predict(X_test))
print("Train Accuracy:", round(train_acc, 3))
print("Test Accuracy :", round(test_acc, 3))
print("\nDecision Tree Rules:\n")
print(export_text(model, feature_names=[f"F{i}" for i in range(X.shape[1])]))
plt.figure(figsize=(12, 8))
plot_tree(
    model,
    feature_names=[f"F{i}" for i in range(X.shape[1])],
    class_names=["Class 0", "Class 1"],
    filled=True
)
plt.title("Decision Tree (ID3 - Entropy)")
plt.show()
