from subprocess import check_output

def get_username():
    return check_output("/usr/bin/gpg --decrypt --quiet ~/.config/offlineimap/username.gpg", shell=True)

def get_password():
    return check_output("/usr/bin/gpg --decrypt --quiet ~/.config/offlineimap/password.gpg", shell=True)
