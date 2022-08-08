import os
import sys
import chromedriver_autoinstaller

dir_name = os.path.dirname(__file__).replace(f"{os.sep}core_lib", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)


class EnvHandler:
    def get_env(self, key):
        print(key)
        return os.environ[key]

    def install_chrome_driver(self):
        plf = sys.platform
        supported_plf = ["win32", "linux", "linux2", "darwin"]
        if plf in supported_plf:
            chromedriver_autoinstaller.install()
