import json

def Check_data_type(data):
    if type(data) == str:
        return "str"
    elif type(data) == int:
        return "int"
    elif type(data) == float:
        return "float"
    elif type(data) == complex:
        return "complex"
    elif type(data) == list:
        return "list"
    elif type(data) == tuple:
        return "tuple"
    elif type(data) == range:
        return "range"
    elif type(data) == dict:
        return "dict"
    elif type(data) == set:
        return "set"
    elif type(data) == frozenset:
        return "frozenset"
    elif type(data) == bool:
        return "bool"
    elif type(data) == bytes:
        return "bytes"
    elif type(data) == bytearray:
        return "bytearray"
    elif type(data) == memoryview:
        return "memoryview"
    else:
        print("ERROR Not found type")

def validateJSON(jsonData):
    try:
        json.loads(jsonData)
    except ValueError as err:
        return "False"
    return "True"

