#!/usr/bin/env python
# encoding: utf-8

from flask import Blueprint

bp_hello = Blueprint("hello", __name__)


@bp_hello.route("/", methods=['GET'])
def hello():
    return "hello world!"
