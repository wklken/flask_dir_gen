#!/usr/bin/env python
# encoding: utf-8

from PROJECT import get_wsgi_app
from config import Config

application = get_wsgi_app(Config)

if __name__ == "__main__":
    from werkzeug.serving import run_simple

    run_simple("127.0.0.1", 8000, application,
               use_reloader=True, use_debugger=True,
               threaded=True, extra_files=["logging.ini"])
