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
@route('/<year:re:\d+>')
@route('/<year:re:\d+>/<month:re:\d+>')
@route('/<year:re:\d+>/<month:re:\d+>/<day:re:\d+>')
def index(year='', month='', **kwargs):
    if request.GET.get('form'):
        return redirect('/new')
    match = ''
    if year:
        match = year
    if month:
        match += '-' + month

    t = dict(km=0, litres=0, price=0)
    mt = dict(km=0, litres=0, price=0)
    yt = dict(km=0, litres=0, price=0, css_class='text-danger')

    options = set()

    def update_totals(r, force=False):
        if month:
            return
        if force or not r['created'].startswith(mt['created']):
            if mt:
                update_conso(mt)
                records.insert(0, mt.copy())
            md = r['created'][:-3]
            mt.update(created=md, km=0, litres=0, price=0)
        if year:
            return
        if force or not r['created'].startswith(yt['created']):
            if yt:
                update_conso(yt)
                records.insert(0, yt.copy())
            yd = r['created'][:-6]
            yt.update(created=yd, km=0, litres=0, price=0)

    records = []
    for i, r in enumerate(db.all()):
        options.add(r['created'][:-3])
        options.add(r['created'][:-6])
        if not r['created'].startswith(match):
            continue
        if 'created' not in mt:
            mt.update(created=r['created'][:-3])
            yt.update(created=r['created'][:-6])
        else:
            update_totals(r)
        for k in t:
            t[k] += r[k]
            mt[k] += r[k]
            yt[k] += r[k]
        update_conso(r)
        if month:
            records.insert(0, r)

    if records:
        update_totals({'created': ''}, force=True)
    update_conso(t)
    options = [('/', 'All monthes')] + [
        ('/' + v.replace('-', '/'), v) for v in sorted(options, reverse=True)
    ]
    match = match or ''
    match = '/' + match.replace('-', '/')
    options = [
        (v, l, v == match and 'selected="selected"' or '')
        for v, l in options
    ]
    return template('index', total=t, records=records, options=options)


@route("/statics/<filepath:re:.*\.jpg>")
@route("/statics/<filepath:re:.*\.css>")
def images(filepath):
    return static_file(filepath, root="statics")


@route('/new')
@route('/new', method='POST')
@auth_basic(check_auth)
def new():
    if request.forms:
        now = datetime.now()
        db.insert(dict(
            {k: float(v.replace(',', '.')) for k, v in request.forms.items()},
            created=now.strftime('%Y-%m-%d')))
        redirect(now.strftime('/%Y/%m'))
    return template('new', request=request)


def main():
    run(host='0.0.0.0', port=4444, reloader=True)


application = default_app()
