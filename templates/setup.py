from setuptools import setup, find_packages


def readfile(filename):
    with open(filename) as f:
        return f.read()


setup(
    name="PROJECT",
    version="0.1.0",
    packages=find_packages(),
    zip_safe=False,
    namespace_packages=["PKG_NAME"],
    install_requires=readfile("requirements.txt"),
    # ensure copy static file to runtime directory
    include_package_data=True,
)
