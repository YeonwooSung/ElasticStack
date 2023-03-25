import json
import os

filename = os.path.join(os.path.dirname(__file__), 'target.json')

with open(filename) as f:
    FORMATTER = json.load(f)
    with open(filename, 'w') as f:
        json.dump(FORMATTER, f, indent=4)
