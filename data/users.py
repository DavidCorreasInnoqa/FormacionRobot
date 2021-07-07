from robot.libraries.BuiltIn import BuiltIn
import os
import json

def get_variables():
    centro = BuiltIn().get_variable_value("${CENTRO}")
    current_path = os.path.dirname(os.path.abspath(__file__))
    with open(current_path + '/' + centro + '/users.json', encoding='utf-8') as f:
        data = json.load(f)
    return_data = data
    return return_data
