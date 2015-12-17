#!/usr/bin/env bash

if [ ! -x $(which wget) ]; then
    brew install wget
fi

# To find out the latest version, visit http://support.code42.com/Release_Notes
wget http://download.crashplan.com/installs/mac/install/CrashPlanPROe/CrashPlanPROe_4.5.0_Mac.dmg
