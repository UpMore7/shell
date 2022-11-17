#!/usr/bin/env bash

# system
#
#   shutdown        shutdown now
#   reboot          reboot
#
#


# Navi 
    clear   
    navi() {
        echo -e "\n"
        echo -e "\t System"
        echo -e "\n\t\t Exit(e) \n\t\t shutdown(s) \n\t\t reboot(r) \n\t\t calc(c)"
        echo -e "\n\n"
        echo -n -e "\t\t Input -> "
        read input
        echo -e "\n\n"
        
        case $input in

            shutdown|s)
                sudo shutdown now
            ;;
            
            reboot|r)
                sudo reboot
            ;;
            
            cal|c)
                clear
                cal
                echo -e "\n\n"
                read dummy
                clear
                navi
            ;;
            
            e)
                clear
                exit 1
            ;;
            
            *)
                clear
                navi
            ;;
            
        esac 
    }
    
    navi



# End
#
#


