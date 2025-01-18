Don't forget to enable sddm.service with:
$ sudo systemctl enable sddm.service

Copy the folder to /usr/share/sddm/themes/

Then change the /etc/sddm.conf file
[Theme]
Current=directory-name

Preview the theme with:
$ sddm-greeter --test-mode --theme /usr/share/sddm/themes/theme-name
