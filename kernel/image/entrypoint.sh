#!/bin/bash
set -e
if [ "$DEV_USER" = "" ]; then
	exec $SHELL
fi
id -u $DEV_UID 2>/dev/null >/dev/null && deluser $(id -n -u $DEV_UID)

getent group $DEV_GID >/dev/null 2>/dev/null && delgroup $(getent group $DEV_GID | cut -d: -f1)

groupadd --gid $DEV_GID $DEV_USER 
useradd --gid $DEV_GID --uid $DEV_UID -K UID_MIN=$DEV_UID -K UID_MAX=$DEV_UID -G sudo,adm,kvm $DEV_USER 

[ -e /dev/kvm ] && chown :kvm /dev/kvm && chmod 0660 /dev/kvm

if [ "$#" -ge 1 ]; then
    HOME=$DEV_HOME exec /usr/bin/chpst -u :$DEV_UID:$DEV_GID $SHELL -c "$*"
else
    HOME=$DEV_HOME exec /usr/bin/chpst -u ${DEV_USER}:${DEV_USER}:adm:sudo:kvm $SHELL
fi
