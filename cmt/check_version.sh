#!/bin/sh
#
# Warn if the setting up from a non-frozen version.

if [ "${CAPTAINRELEASEROOT}x" = "x" ]; then
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    echo % CAPTAINRELEASEROOT is not defined.
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    return
fi

if [ ! -f ${CAPTAINRELEASEROOT}/cmt/version.cmt ]; then
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    echo % The version file version.cmt is missing
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    return
fi

if grep master ${CAPTAINRELEASEROOT}/cmt/version.cmt >> /dev/null; then
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    echo % Development version of captainRelease is being used.
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    return
fi

if grep '\.999' ${CAPTAINRELEASEROOT}/cmt/version.cmt >> /dev/null; then
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    echo % Development version of captainRelease is being used.
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    return
fi

if ! grep '\.[0-9]\+$' ${CAPTAINRELEASEROOT}/cmt/version.cmt >> /dev/null; then
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    echo % Development version of captainRelease is being used.
    echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    return
fi
