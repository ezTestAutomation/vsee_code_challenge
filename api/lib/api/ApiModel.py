import os
import sys


dir_name = os.path.dirname(__file__).replace(f"{os.sep}lib{os.sep}api", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)


from core_lib import ApiHandler, Logger


class ApiModel:
    def __init__(self, log_level="DEBUG"):
        self.logger = Logger.Logger(
            __name__.split(".")[-1], log_level=log_level
        )
        self.api = ApiHandler.ApiHandler()

    def send_request(self, method, url, **kwargs):
        """
        Send a request
        :param method:
        :param url:
        :param kwargs:
        :return: formatted response
        """
        # customize method for project
        return self.api.send_request(method=method, url=url, **kwargs)

    def send_json_request(self, method, url, **kwargs):
        """
        Send a request
        :param method:
        :param url:
        :param kwargs:
        :return: formatted response
        """
        # customize method for project
        return self.api.send_json_request(method=method, url=url, **kwargs)
