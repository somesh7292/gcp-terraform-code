import os
from flask import jsonify, Request

def helloworld(request):
    if request.path == "/helloworld":
        return ("Hello, world!", 200)
    if request.path == "/apikey":
        api_key_value = os.environ.get("API_KEY", "Not found")
        return jsonify({"status": "success", "api_key": api_key_value})
    if request.path == "/healthz":
        return ("OK", 200)
    if request.method != 'GET':
        return ("Method Not Allowed", 405)
    
    return ("Invalid Path", 404)