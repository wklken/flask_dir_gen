# flask_dir_gen

Generate flask project dir at one command


### Usage

#### 1. generate

use `test` as the example

generate flask project dir

```
sh init_project.sh test
```

then you got

```
test
├── CHANGELOG.md
├── DOC.md
├── MANIFEST.in
├── README.md
├── config-sample.py
├── config.py -> $THE_PATH_OF/flask_dir_gen/test/config-sample.py
├── requirements.txt
├── runserver.py
├── setup.py
├── sql
└── test
    ├── __init__.py
    ├── app.py
    ├── configs
    │   ├── __init__.py
    │   └── settings.py
    ├── models
    │   └── __init__.py
    ├── static
    │   ├── css
    │   ├── img
    │   └── js
    ├── templates
    ├── utils
    │   └── __init__.py
    ├── viewmodels
    │   └── __init__.py
    └── views
        ├── __init__.py
        └── hello.py

12 directories, 18 files

```

#### 2. start

```
cd test

python runserver.py
 * Running on http://127.0.0.1:8000/ (Press CTRL+C to quit)
 * Restarting with stat
```

then you can access `http://127.0.0.1:8000/`


#### pkg

```
python setup.py sdist
```

you got
```
dist/
└── Test-0.1.0.tar.gz
```

you can use `pip install` to install the package



------------------------
------------------------


wklken

Email: wklken@yeah.net

Github: https://github.com/wklken

Blog: [http://www.wklken.me](http://www.wklken.me)
