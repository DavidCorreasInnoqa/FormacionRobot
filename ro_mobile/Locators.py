import json
import os


def get_locators(platform, po):
    current_path = os.path.dirname(os.path.abspath(__file__))

    with open(current_path + f'/{platform}/{po}.json', encoding='utf-8') as f:
        data = json.load(f)
    return data

