#!/usr/bin/env python
# encoding: utf-8
"""
"""

from __future__ import unicode_literals, division

from flask import Flask

import logging
# from flask import g, current_app
# from flask import _app_ctx_stack
# from redis import StrictRedis
# from sqlalchemy.engine import engine_from_config
# from sqlalchemy.orm import sessionmaker, scoped_session

from PROJECT.views.hello import bp_hello


def get_wsgi_app(config):

    app = Flask("PROJECT")
    app.config.from_object(config)

    # register blueprint
    blueprints = (bp_hello, )
    for bp in blueprints:
        app.register_blueprint(bp)

    # orm and redis, default not open
    # app.sa_engine = engine_from_config(app.config["SQLALCHEMY_OPTIONS"],
                                       # prefix="")

    # app.DBSession = scoped_session(sessionmaker(bind=app.sa_engine),
                                   # scopefunc=_app_ctx_stack.__ident_func__)

    # app.redis_client = StrictRedis(**app.config["REDIS_CONFIG"])

    # @app.before_request
    # def before_request():
        # g.rds = current_app.redis_client
        # g.db = current_app.DBSession()

    # @app.teardown_request
    # def teardown_request(exception):
        # g.db.close()
    # init thrall sentry
    if (not app.debug) and app.config.get("SENTRY_ON", False):
        from raven.contrib.flask import Sentry
        sentry = Sentry(dsn=app.config["SENTRY_DSN"], logging=True, level=logging.ERROR)
        app.config['SENTRY_NAME'] = app.config["SENTRY_IDENTIFY"]
        sentry.init_app(app)

    return app
