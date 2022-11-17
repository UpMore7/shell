#!/usr/bin/env bash
#
#
# rewardcalc
#
#


# Run
   run() {
      echo -e "\n"
      echo -e "\t Reward Calculater"
      echo -e "\n\t\t"
      echo -n -e "\t\t Volumen (Token or $) -> "
      read volumen
      echo -n -e "\t\t Rewards (in %) -> "
      read reward
   }
    

# Content
   content() {
    
      a=$volumen
      b=$reward
    
      year=$(echo "scale=4; ($a/100)*$b" | bc | awk '{printf "%f", $0}')
      month=$(echo "scale=4; ($a/100)*$b/12" | bc | awk '{printf "%f", $0}')
      day=$(echo "scale=4; ($a/100)*$b/365" | bc | awk '{printf "%f", $0}')
      hour=$(echo "scale=4; ($a/100)*$b/8760" | bc -l | awk '{printf "%f", $0}')

      echo -e "\n\n\t\t Volumen \t $a"
      echo -e "\t\t Reward \t $b%"
      echo -e "\n\t\t Year \t\t $year"
      echo -e "\t\t Month \t\t $month"
      echo -e "\t\t Day \t\t $day"
      echo -e "\t\t Hour \t\t $hour"
      echo -e "\n\n"
   }


# Exit
   exit_f() {
      echo -n -e "\n\n\n\t Exit(e) | Repeat(*) -> "
      read exit_f
      if [ "$exit_f" == "e" ]
      then
         clear
         exit 1
      else
         init
      fi      
   }
    
    
# Init
   init() {
      clear
      run
      content
      exit_f  
   }
   init



# End
#
#

