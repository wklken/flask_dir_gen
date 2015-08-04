#!/bin/bash

#TODO: 1. change to with package name or not 2. add more options the change gen specific dir

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

# for diff between mac and linux

UNAME=`uname`
EMPTY="''"
if [ $UNAME = "Darwin" ]
then
    alias sed="sed -i ''"
fi


# get project name

PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]
then
    echo "PROJECT_NAME is required"
    exit 1
fi
PROJECT_NAME=`echo $PROJECT_NAME | tr '[:upper:]' '[:lower:]'`
PROJECT_NAME_FIRST_CHAR_UPPER=`echo $PROJECT_NAME | awk '{ print toupper(substr($0, 1, 1)) substr($0, 2) }'`


PROJECT_DIR="$CURRENT_DIR/$PROJECT_NAME"

TEMPLATE_DIR=$CURRENT_DIR/templates

if [ -e $PROJECT_DIR ]
then
    echo "$PROJECT_DIR alread exists, if you want to create a new one, just remove it"
    exit 1
fi

mkdir $PROJECT_DIR

# git
cp $TEMPLATE_DIR/Python.gitignore $PROJECT_DIR/.gitignore


# readme
cp $TEMPLATE_DIR/README.md $PROJECT_DIR/

# doc
cp $TEMPLATE_DIR/DOC.md $PROJECT_DIR/

# changelog
cp $TEMPLATE_DIR/CHANGELOG.md $PROJECT_DIR/

# SED
sed "s#PROJECT#$PROJECT_NAME#g" $PROJECT_DIR/README.md

# packages
cp $TEMPLATE_DIR/MANIFEST.in $PROJECT_DIR/
cp $TEMPLATE_DIR/requirements.txt $PROJECT_DIR/

# config
cp $TEMPLATE_DIR/config-sample.py $PROJECT_DIR/
ln -s $PROJECT_DIR/config-sample.py $PROJECT_DIR/config.py
sed "s#PROJECT#$PROJECT_NAME#g" $PROJECT_DIR/config-sample.py
sed "s#PROJECT#$PROJECT_NAME#g" $PROJECT_DIR/config.py



# project dir
cp $TEMPLATE_DIR/runserver.py $PROJECT_DIR/
# SED
sed "s#PROJECT#$PROJECT_NAME#g" $PROJECT_DIR/runserver.py

cp $TEMPLATE_DIR/setup.py $PROJECT_DIR/
# SED
sed "s#PROJECT#$PROJECT_NAME_FIRST_CHAR_UPPER#g" $PROJECT_DIR/setup.py
sed "s#PKG_NAME#$PROJECT_NAME#g" $PROJECT_DIR/setup.py

mkdir $PROJECT_DIR/sql
mkdir $PROJECT_DIR/$PROJECT_NAME
CODE_DIR=$PROJECT_DIR/$PROJECT_NAME
echo "__import__('pkg_resources').declare_namespace(__name__)" > $CODE_DIR/__init__.py
echo "from $PROJECT_NAME.app import get_wsgi_app" >> $CODE_DIR/__init__.py

cp $TEMPLATE_DIR/app.py $CODE_DIR/app.py
sed "s#PROJECT#$PROJECT_NAME#g" $CODE_DIR/app.py


# TODO: maybe not must
mkdir $CODE_DIR/templates
mkdir $CODE_DIR/static
mkdir $CODE_DIR/static/css
mkdir $CODE_DIR/static/js
mkdir $CODE_DIR/static/img

mkdir $CODE_DIR/configs
touch $CODE_DIR/configs/__init__.py
touch $CODE_DIR/configs/settings.py

mkdir $CODE_DIR/views
touch $CODE_DIR/views/__init__.py
cp $TEMPLATE_DIR/hello.py $CODE_DIR/views/

mkdir $CODE_DIR/utils
touch $CODE_DIR/utils/__init__.py
# cp $TEMPLATE_DIR/permission.py $CODE_DIR/utils/


mkdir $CODE_DIR/models
touch $CODE_DIR/models/__init__.py

mkdir $CODE_DIR/viewmodels
touch $CODE_DIR/viewmodels/__init__.py





