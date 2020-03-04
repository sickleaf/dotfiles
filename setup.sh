#!/bin/sh

BASHRC=$(find ~/.bashrc)
checkHIST=$(grep "HISTTIMEFORMAT=" ${BASHRC}) 

if [ -z "${checkHIST}" ];then
  echo '' >> ${BASHRC}
  echo 'export HISTTIMEFORMAT="%F_%T "' >> ${BASHRC}
  echo "[DONE] HISTTIMEFORMAT (${BASHRC})"
fi

. ${BASHRC}
