#!/bin/bash
#
# Notify of MacPort updates via Growl on Mac OS X
#
# Author: Chris Streeter http://www.chrisstreeter.com
# Requires: Growl Notify Extra to be installed (but fails gracefully). Info
#       about how to get the extra is at http://growl.info/extras.php


TERM_APP='/Applications/Terminal.app'
PORT_EXEC='/opt/local/bin/port'
GROWL_NOTIFY='/usr/local/bin/growlnotify'
GROWL_TITLE="MacPort Update(s) Available"
GROWL_ARGS="-n 'MacPorts' -d $GROWL_NOTIFY -a $PORT_EXEC"

$PORT_EXEC sync 2>&1 > /dev/null
outdated=`$PORT_EXEC outdated`

if echo $outdated | grep -q 'No installed ports are outdated.' ; then
    if [ -e $GROWL_NOTIFY ]; then
        # No updates available
        $GROWL_NOTIFY $GROWL_ARGS -m '' -t "No MacPort Updates Available"
    fi
else
    # We've got an outdated port or two
    
    # Nofity via growl
    if [ -e $GROWL_NOTIFY ]; then
        lc=$((`echo "$outdated" | wc -l` - 1))
        outdated=`echo "$outdated" | tail -$lc | cut -d " " -f 1`
        message=`echo "$outdated" | head -5`
        if [ "$outdated" != "$message" ]; then
            message="Some of the outdated packages are:
$message"
        else
            message="The following packages are outdated:
$message"
        fi
        # Send to growlnotify
        echo "$message" | $GROWL_NOTIFY $GROWL_ARGS -s -t $GROWL_TITLE
    fi
fi