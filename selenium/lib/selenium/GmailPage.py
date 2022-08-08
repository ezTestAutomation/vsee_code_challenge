import os
import sys
from datetime import datetime


dir_name = os.path.dirname(__file__).replace(f"{os.sep}lib{os.sep}selenium", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)

from core_lib import Utility
from core_lib.GmailHelper import GmailHelper


class GmailPage:
    def __init__(self):
        self.gmail_helper = GmailHelper()

    def get_totp(self, gpg_key: str):
        return Utility.get_otp(gpg_key)

    def get_current_time_in_miliseconds(self):
        return datetime.now().timestamp()

    def get_latest_sent_mail_info(self, email, app_password):
        result = self.gmail_helper.get_sent_mails(email, app_password)
        if result:
            return result[0]
