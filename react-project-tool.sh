#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. ${SCRIPT_DIR}/rpt-common.sh $@

echo ""
echo "SCRIPT DIR: ${SCRIPT_DIR}"
echo "ROOT DIR: ${ROOT_DIR}"
echo "PROJECT DIR: ${PROJECT_DIR}"
echo "PROJECT NAME: ${PROJECT_NAME}"
echo "COMPONENT NAME: ${COMPONENT}"
echo "STORYBOOK JS: ${STORYBOOKJS}"
echo "MOBX: ${MOBX}"
echo ""

# create react project if not exists
. ${SCRIPT_DIR}/rpt-react.sh $@

# init storybook
if [ "${STORYBOOKJS}" == YES ]; then
    . ${SCRIPT_DIR}/rpt-storybookjs.sh $0
fi

cd "${ROOT_DIR}"
# clear all variables
exec bash