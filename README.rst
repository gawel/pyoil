pyoil
================================================

Small app to track your oil expenses.

Clone the repo::

$ git clone git@github.com:gawel/pyoil.git
$ cd pyoil

Create a venv and install the soft::

$ PYTHON=python3 make

Start the app for testing::

$ make serve

Go to http://localhost:4444/new

Default login/password is: admimin / passwd

Use whatever wsgi server for production. `pyoil.application` is a wsgi app::

$ ADMIN_PASSWORD=yourpassword ./venv/bin/chaussette pyoil.application --port 8080

PyOil use `TinyDB <https://tinydb.readthedocs.io/en/latest/>`_ The database is
located at `~/.pyoil.json`
