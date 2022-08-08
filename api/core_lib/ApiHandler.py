import os
import sys


dir_name = os.path.dirname(__file__).replace(f"{os.sep}core_lib", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)


try:
    import requests
    from core_lib import Logger

except ImportError as imp_err:
    print("There was an error importing files - From %s" % __file__)
    print("\n---{{{ Failed - " + format(imp_err) + " }}}---\n")
    raise


class ApiHandler:

    ROBOT_LIBRARY_SCOPE = "SUITE"
    REQUEST_TIMEOUT_DEFAULT = 120

    def __init__(self, log_level="DEBUG"):
        self.logger = Logger.Logger(__name__.split(".")[-1], log_level=log_level)
        self.session = requests.Session()

    def send_json_request(
        self,
        method,
        url,
        timeout=REQUEST_TIMEOUT_DEFAULT,
        params=dict(),
        **kwargs,
    ):
        """
        Send request
        :param method:
        :param url:
        :param timeout:
        :param kwargs:
        :return: formatted response
        """
        requests_map = {
            "GET": self.session.get,
            "PUT": self.session.put,
            "POST": self.session.post,
            "PATCH": self.session.patch,
            "DELETE": self.session.delete,
        }
        r = None
        if len(params) == 0:
            r = requests_map.get(method.upper())(url=url, timeout=timeout, **kwargs)
        else:
            r = requests_map.get(method.upper())(
                url=url, timeout=timeout, json=params, **kwargs
            )
        return self._format_response(r)

    def send_request(self, method, url, timeout=REQUEST_TIMEOUT_DEFAULT, **kwargs):
        """
        Send request
        :param method:
        :param url:
        :param timeout:
        :param kwargs:
        :return: formatted response
        """
        requests_map = {
            "GET": self.session.get,
            "PUT": self.session.put,
            "POST": self.session.post,
            "PATCH": self.session.patch,
            "DELETE": self.session.delete,
        }
        r = requests_map.get(method.upper())(url, timeout=timeout, **kwargs)
        return self._format_response(r)

    def _format_response(self, response):
        """
        :param response: response object
        :return: a dict format of response includes the following keys:
            request url
            response body
            response code
            response headers
            response time (in seconds)
        """
        try:
            body = response.json()
        except Exception:
            body = response.content
        output = {
            "url": response.url,
            "body": body,
            "code": response.status_code,
            "headers": response.headers,
            "time": response.elapsed.total_seconds(),
            "cookies": response.cookies,
        }
        return output
