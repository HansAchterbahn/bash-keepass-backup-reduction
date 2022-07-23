# Bash Script: keepass-backup-reduction

This bash script is used to reduce backups to 7 of a kind (daily, weekly, monthly, yearly). I use it as an addition to my keepass-backup script. It allows me to reduce backups without losing too much information. It can also be used for other backup reductions of single files.

| variables        | function                                                                |
| ---------------- | ----------------------------------------------------------------------- |
| type             | array with file search strings (kinds)                                  |
| keep             | ammount of files to keep                                                |
