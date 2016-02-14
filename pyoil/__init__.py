# -*- coding: utf-8 -*-
import os
from datetime import datetime
from tinydb import TinyDB
from bottle import route, run, template, request, default_app

db = TinyDB(os.path.expanduser('~/.pyoil.json'))


@route('/')
@route('/', method='POST')
def index():
    if request.forms:
        db.insert(dict({k: int(v) for k, v in request.forms.items()},
                       created=datetime.now().strftime('%Y-%m-%d')))
    records = db.all()
    t = dict(km=0, litres=0, price=0)
    for r in records:
        for k in t:
           t[k] += r[k]
        r['conso'] = '%.2f' % (float(r['km']) / float(r['litres']))
    t['conso'] = '%.2f' % (float(t['km']) / float(t['litres']))
    return template('index', total=t, records=records, request=request)


def main():
    run(host='0.0.0.0', port=4444)

application = default_app()
