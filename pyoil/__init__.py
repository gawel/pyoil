# -*- coding: utf-8 -*-
import os
from datetime import datetime
from tinydb import TinyDB
from bottle import (
    route, run, template, request, default_app, redirect,
    auth_basic, static_file,
)

db = TinyDB(os.path.expanduser('~/.pyoil.json'))


def check_auth(user, pw):
    auth = ('admimin', os.environ.get('ADMIN_PASSWORD', 'passwd'))
    if (user, pw) == auth:
        return True
    return False


def update_conso(r):
    if r['litres']:
        c = float(r['litres']) / r['km'] * 100
    else:
        c = 0
    r['conso'] = '%.2f' % c


@route('/')
def index():
    if request.GET.get('form'):
        return redirect('/new')
    records = []
    t = dict(km=0, litres=0, price=0)
    for r in db.all():
        for k in t:
            t[k] += r[k]
        update_conso(r)
        records.insert(0, r)
    update_conso(t)
    return template('index', total=t, records=records, request=request)


@route("/statics/<filepath:re:.*\.jpg>")
@route("/statics/<filepath:re:.*\.css>")
def images(filepath):
    return static_file(filepath, root="statics")


@route('/new')
@route('/new', method='POST')
@auth_basic(check_auth)
def new():
    if request.forms:
        db.insert(dict(
            {k: float(v.replace(',', '.')) for k, v in request.forms.items()},
            created=datetime.now().strftime('%Y-%m-%d')))
        redirect('/')
    return template('new', request=request)


def main():
    run(host='0.0.0.0', port=4444, reloader=True)


application = default_app()
