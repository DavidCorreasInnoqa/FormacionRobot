import os
import json

def get_locators(plataforma, po):
    current_path = os.path.dirname(os.path.abspath(__file__))

    if plataforma == 'Android':
        with open(current_path + '/Android' + '/' + po + '.json', encoding='utf-8') as f:
            data = json.load(f)
        return data

    elif plataforma == 'IOS':
        with open(current_path + '/IOS' + '/' + po + '.json', encoding='utf-8') as f:
            data = json.load(f)
        return data
