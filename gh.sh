#!/usr/bin/env bash
#
#
#  GitHub Navi
#



# Base
   parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
   cd "$parent_path"
   PS1=""
    
    
# Vars
   user="UpMore7"   
   repo="shell"


# Source  
   source gh_token.sh


# Navi
   navi() {
      clear
      echo -e "\n\t GitHub Menu"
      echo -e "\n\n\t\t User = $user"
      echo -e "\n\t\t Repo = $repo"
      echo -e "\n\t\t Token = $token"
      echo -e "\n\n\t\t\t u = upload"
      echo -e "\t\t\t d = download"
      echo -e "\t\t\t e = exit"
      echo -n -e "\n\n\t\t Input -> "
      read input
      
      case $input in 
        
         upload|u)
            echo -n -e "\t\t Message -> "         
            read message
            upload
            ;;
            
         download|d)
            download
         ;;
          
         exit|e)
            clear
            exit 1
         ;;
            
         *)
            echo -e -n "\n\n\t\t\t Unknow command"
            read dummy
            navi
         ;;
         
      esac
      }


   
# Upload
   upload() {   
      git add .
      git commit -m "$message"
      git push $repo master
      read dummy
      navi
   }

   
# Download
   download() {
      git pull $repo master
      read dummy
      navi
   }


# Init  
   navi   
   
   
   
# END
#
#

