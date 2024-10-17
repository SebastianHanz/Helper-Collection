# Generate argon2 encrypted Password

For usage in .env-file use:

    echo -n "MySecretPassword" | argon2 "$(openssl rand -base64 32)" -e -id -k 65540 -t 3 -p 4

---
    Example-Output: $argon2id$v=19$m=65540,t=3,p=4$TExLRFRBWUJGbC9PMm1USGd2ZDk5dlI2OVZqamovcGl4YWN3aVQ5UEZSZz0$FCCKtVg9cUfg2mRWkK+vGm77ZbtS9As/IvADtxDobjk

For usage in docker-compose.yml directly use:

    echo -n "MySecretPassword" | argon2 "$(openssl rand -base64 32)" -e -id -k 65540 -t 3 -p 4 | sed 's#\$#\$\$#g'
---

    output: $$argon2id$$v=19$$m=65540,t=3,p=4$$dHZ3bkN3N2RLd2dRdmt2NUQ4V1VMZTdPZC9OK000ckhPSEt5QXZuUTM5QT0$$XTj1lf2lbWdX6EwK4RhQwz2N4L+josbBDzUBV4bBJnM
