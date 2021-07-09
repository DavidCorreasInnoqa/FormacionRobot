import json
import os


def get_locators(platform, po):
    current_path = os.path.dirname(os.path.abspath(__file__))

    with open(current_path + f'/Common/{po}.json', encoding='utf-8') as f:
        common_loc = json.load(f)
        for key, value in common_loc.items():
            if platform == "Android":
                common_loc[key] = value.format("resource-id")
            if platform == "IOS":
                common_loc[key] = value.format("name")

    with open(current_path + f'/{platform}/{po}.json', encoding='utf-8') as f:
        po_loc = json.load(f)

    locators = {**common_loc, **po_loc}

    return locators

