#!/bin/bash

#THIS SCRIPT WILL APPLY THE RECOMMENDATION WHICH ARE APPROVED BY REVIEWER

#DECLARING THE VARAIABLES
RECOMMEDNATION="/tmp/recommendation"
tail -n1 file.config > ${RECOMMEDNATION}
read RECOMMENDED < ${RECOMMEDNATION}

if [[ ${RECOMMENDED} = CHANGE_MACHINE_TYPE ]]
then
    echo "${RECOMMENDED}"
    sed -n '/Resource Name:/,/Action:/{/Resource Name:/!{/Action:/!p}}' file.config
fi

if [[ ${RECOMMENDED} = DELETE_IMAGE ]]
then
    echo "${RECOMMENDED}"
    sed -n '/Resource Name:/,/Action:/{/Resource Name:/!{/Action:/!p}}' file.config
fi
