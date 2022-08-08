import imaplib
import email
import sys
import os

dir_name = os.path.dirname(__file__).replace(f"{os.sep}core_lib", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)


class GmailHelper:
    def __init__(self):
        self.SMTP_SERVER = "imap.gmail.com"
        self.SMTP_PORT = 993

    def __detect_names(self, mail):
        """Detect native names for standard folders (using flags)."""

        keys = {
            "\\Sent": "SENT",
            "\\Drafts": "DRAFTS",
            "\\Junk": "JUNK",
            "\\Trash": "TRASH",
            "\\Important": "IMPORTANT",
            "\\All": "ALL",
        }

        result = {
            "INBOX": "INBOX",
            "SENT": None,
            "DRAFTS": None,
            "JUNK": None,
            "TRASH": None,
            "IMPORTANT": None,
            "ALL": None,
        }

        data = mail.list()

        for folder in data[1]:
            all_flags, name = folder.decode("utf-8").split(' "/" ')
            for flag, key in keys.items():
                if flag in all_flags:
                    result[key] = name

        return result

    def get_sent_mails(
        self,
        email_address,
        app_password,
        max_mails_to_look=1,
    ):
        mail = self.__get_mail(email_address, app_password)
        result = self.__detect_names(mail)
        status, messages = mail.select(result.get("SENT"))
        result = []
        if status == "OK":
            messages = int(messages[0])
            max_mails_to_look = (
                messages if messages < max_mails_to_look else max_mails_to_look
            )
            for i in range(messages, messages - max_mails_to_look, -1):
                res, msg = mail.fetch(str(i), "(RFC822)")
                for response in msg:
                    if isinstance(response, tuple):
                        msg = email.message_from_bytes(response[1])
                        From = msg["From"]
                        subject = msg["Subject"]
                        to = msg["To"]
                        result.append(
                            {"FROM": From, "TO": to, "SUBJECT": subject}
                        )
        return result

    def __get_mail(
        self, email_address: str, password: str
    ) -> imaplib.IMAP4_SSL:
        mail = imaplib.IMAP4_SSL(self.SMTP_SERVER)
        mail.login(email_address, password)
        return mail
