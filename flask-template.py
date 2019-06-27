#!/usr/bin/python
# https://scotch.io/bar-talk/processing-incoming-request-data-in-flask

import mysql.connector
from flask import Flask, request
app = Flask(__name__)

@app.route('/')
def hello():
  return "Hello there!"

@app.route('/test')
def test():
  return "test"

@app.route('/help')
def help():
  return "there is no help for you here"

# @app.route('/query',methods=['POST'])
# def query():
#     language = request.args.get('language')
#     return '''<h1> The language value is: {} </h1>'''.format(language)

@app.route('/queryform',methods=['POST','GET'])
def queryform():
    if request.method == 'GET':
        return '''<form method="POST">
                    Language: <input type="text" name="language"><br>
                    <input type="submit" value="Submit"><br>
                    </form>'''

    if request.method == 'POST':
        language = request.form['language']
        return '''<h1> The language value is: {} </h1>'''.format(language)

if __name__ == '__main__':
  app.run(host='0.0.0.0',port=8000)
