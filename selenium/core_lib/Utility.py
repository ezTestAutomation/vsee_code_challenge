import os
import sys


dir_name = os.path.dirname(__file__).replace(f"{os.sep}core_lib", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)


try:
    import json
    import yaml
    import pyotp
    from core_lib import Logger

except ImportError as imp_err:
    print("There was an error importing files - From %s" % __file__)
    print("\n---{{{ Failed - " + format(imp_err) + " }}}---\n")
    raise


logger = Logger.Logger(__name__.split(".")[-1], log_level="DEBUG")


def read_yaml(file):
    with open(file, "r") as f:
        return yaml.safe_load(f)


def write_to_yaml(dict_content, file):
    with open(file, "w") as f:
        return yaml.dump(dict_content, f)


def write_json(dict_content, file):
    with open(file, "w") as f:
        return json.dump(dict_content, f)


def read_json(file):
    with open(file, "r") as f:
        return json.load(f)


def read_file(file):
    with open(file, "r") as f:
        return f.read()


def write_file(file, data):
    with open(file, "w") as f:
        return f.write(data)


def get_otp(gpg_key: str):
    return pyotp.TOTP(gpg_key).now()
