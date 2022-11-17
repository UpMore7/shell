#!/usr/bin/env bash

# Panel
#


# Base
    parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
    cd "$parent_path"
    PS1=""


# Vars

    a=$1
    b=$2


# Navi
    navi() {
        echo -e "\n"
        echo -e "\t Panel"
        echo -e "\n"
        echo -n -e "\t\t Input -> "
        read input
        case $input in
            
            
    # Config  
     
            help|h)
                bash help/help.sh
            ;;
            
            backup|b)
                bash backup/backup.sh
            ;;
            
            update|u)
                bash update/update.sh
            ;;
            
            cryptoticker|c)
                bash cryptoticker/cryptoticker.sh
            ;;

            system|s)
                bash system/system.sh
            ;;
            
            rewardcalc|r)
                bash rewardcalc/rewardcalc.sh
            ;;
 
            
            
            
    # End Config
     
            e)
                clear
                exit 1
            ;;
            *)
                echo -e -n "\n\n\t\t\t Unknow command - use <help>"
                read dummy
                clear
            ;;
        esac
        navi
    }
    navi



# End
#
#


