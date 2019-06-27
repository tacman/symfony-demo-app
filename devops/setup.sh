#!/usr/bin/env sh

ret=0
for builder in $(ls devops/docker/*/setup.sh); do
    service=$(dirname ${builder})
    sh -xc "cd ${service}; ./setup.sh" 2>&1
    last=$?; [ ${last} -ne 0 ] && ret=${last}
done

exit ${ret}
