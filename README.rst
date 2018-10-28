pyoil
================================================

Small app to track your oil expenses.

Clone the repo::

$ git clone git@github.com:gawel/pyoil.git
$ cd pyoil

Create a venv and install the soft::

$ make

Start the app for testing::

$ make serve

Use whatever wsgi server for production. `pyoil.application` is a wsgi app::

$ ./venv/bin/chaussette pyoil.application --port 8080

