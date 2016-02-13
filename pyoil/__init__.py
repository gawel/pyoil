# -*- coding: utf-8 -*-
import os
from datetime import datetime
from tinydb import TinyDB
from bottle import route, run, template, request

db = TinyDB(os.path.expanduser('~/.pyoil.json'))


@route('/')
@route('/', method='POST')
def index():
    db.insert(dict({k: int(v) for k, v in request.forms.items()},
                   created=datetime.now().strftime('%Y-%m-%d')))
    records = db.all()
    return template('index', records=records)


def main():
    run(host='0.0.0.0', port=4444)
