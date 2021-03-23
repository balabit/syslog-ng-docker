#!/bin/bash

# This script tries to install a specific version of Syslog-ng. (or the "latest" version)

# The problem is that apt-get do not preserve the version number while
# it is resolving metapackage dependencies. (Which is logical. If there
# is any version restriction we should list them in the metapackage.)
# 
# example:
#   We have a metapackage "foo", which lists "biz" and "baz" as
#   dependencies. The command apt-get install foo=42, will install
#   the latest greatest version of the biz and baz packages.
# 
# Since the dependencies of the syslog-ng metapackage can change from
# version to version, (adding or removing modules) we can not hardcode
# the package list in the apt-get command.
# 
# As a workaround this script queries the list of the dependencies of
# the specific version of the syslog-ng metapackage. Parses the output,
# than generates an apt-get install command where each package has the
# same fixed version number in the form of <package-name>=VERSION.


if [ $# -eq 0 ]; then
    echo "Please provide the version number you wish to install as a first parameter of the script. (This sciprt is intended to use from the Dockerfile, maybe you are executing it by a mistake.)"
    exit 1;
else
    SYSLOG_NG_VERSION=$1
fi


if [ "$SYSLOG_NG_VERSION" = "master" ]; then
    SYSLOG_NG_INSTALL_STRING="syslog-ng"
else
    NUMBER_OF_MATCHING_VERSIONS=$(apt-cache madison syslog-ng | awk '{print $3}' | grep -c $SYSLOG_NG_VERSION)
    if [ $NUMBER_OF_MATCHING_VERSIONS -eq 0 ]; then
        echo "Unable to find a matching version of Syslog-ng ($SYSLOG_NG_VERSION)"
        exit 1;
    elif [ $NUMBER_OF_MATCHING_VERSIONS -gt 1 ]; then
        echo "Version number is ambiguous, there are more than one matching Syslog-ng version: ($SYSLOG_NG_VERSION)";
        exit 1;
    fi

    SYSLOG_NG_INSTALL_STRING=$(LANG=C apt-cache depends syslog-ng=$SYSLOG_NG_VERSION | sed -n -r 's/\s+(Recommends|Depends): ([a-z0-9-]+)/\2='"$SYSLOG_NG_VERSION"'/p' | tr '\n' ' ')
fi



# The package manager is intentionally the last command of this script.
# If you change this, please store the exit code and return it manually.

echo "Syslog-ng will be installed with the following apt-get command: apt-get install -y libdbd-mysql libdbd-pgsql libdbd-sqlite3 $SYSLOG_NG_INSTALL_STRING"
apt-get install -y libdbd-mysql libdbd-pgsql libdbd-sqlite3 $SYSLOG_NG_INSTALL_STRING
