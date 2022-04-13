#!/bin/bash
# Simple script to launch several tools from the command line

# Include functions from other file(s)
source toolsmenu.sh
# ...

# Main body
main-menu
read Action
case $Action in
  1 )
    #launch antivirus tools
    # ...
    antivirus
    ;;

  2 )
    #Analyse a directory
    #Check permissions
    # ...
    ;;
  3 )
    #Make a back up with tar
    # ...
    backup
    ;;

  * )
    echo "sorry, wrong option"
    exit 1
    ;;

  esac
  exit 0
