#!/bin/sh

scriptDir=$(cd $(dirname $0); pwd);
backupDir=${scriptDir}/dotfilesBK

mkdir -p ${backupDir}

BASHRC=$(find ${HOME}/.bashrc)
INPUTRC=${HOME}/.inputrc

checkHIST=$(grep "HISTTIMEFORMAT=" ${BASHRC}) 

### if HISTTIMEFORMAT= line exists, do nothing
### if not, append setting

if [ -z "${checkHIST}" ];then
  echo '' >> ${BASHRC}
  echo 'export HISTTIMEFORMAT="%F_%T "' >> ${BASHRC}
  echo "[DONE] HISTTIMEFORMAT (${BASHRC})"
fi

### if ~/.inputrc exists, backup ${INPUTRC} before replacing .inputrc

if [ -f ${INPUTRC} ];then
	cp -pv ${INPUTRC} ${backupDir}
fi

cp -pv ${scriptDir}/.inputrc ${INPUTRC}



. ${BASHRC}
. ${INPUTRC}
