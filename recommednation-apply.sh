#!/bin/bash

#THIS SCRIPT WILL APPLY THE RECOMMENDATION WHICH ARE APPROVED BY REVIEWER

#DECLARING THE VARAIABLES
RECOMMEDNATION="/tmp/recommendation"
tail -n1 file.config > ${RECOMMEDNATION}
read RECOMMENDED < ${RECOMMEDNATION}

if [[ ${RECOMMENDED} = CHANGE_MACHINE_TYPE ]]
then
    echo "${RECOMMENDED}"
    sed -n '/Resource Name:/,/Action:/{/Resource Name:/!{/Action:/!p}}' file.config > resources.log
    while read -r RESOURCE
    do
        RESOURCE_NAME="${RESOURCE}"
        while read -r IGNORE_RESOURCES
        do
            IGNORE_LIST="${IGNORE_RESOURCES}"
            if [[ ${RESOURCE_NAME} != ${IGNORE_LIST} ]]
            then

            fi 
        done < ignore_list.log
    done < resource.log 
fi

if [[ ${RECOMMENDED} = DELETE_IMAGE ]]
then
    echo "${RECOMMENDED}"
    sed -n '/Resource Name:/,/Action:/{/Resource Name:/!{/Action:/!p}}' file.config
fi
