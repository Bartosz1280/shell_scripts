###  neamefix() -  changes format of file/directories names in the PWD
###  -s flag changes spaces to underscores (_)
###  -c flag changes uppercases to lowercases

### add the function to your .bashrc/.zshrc 
namefix()
{ 
  if [[ $# -lt 1 ]];then                                         # returns infor about the function when no flag is provied
      echo 'script uasge : namefix [-s] [-c]'
   fi
  while getopts 'cs' OPTION; do                                  # get -cs flags
    case "$OPTION" in
      s)                                                         # flag for removing spaces
       SPC=" " 
         if [[ "$PWD" == "$HOME" ]]; then                        # avoids doing changes in home directory
           echo "> namefix warn: you are at home"
         else
           for NMS in *;do                                       # loops through files/directories names
             if [[ $NMS == *$SPC* ]]; then
                 NNMS=$(echo  $NMS | tr " " _)                   # remove spaces
                 mv "$NMS" "$PWD/$NNMS"                          # changes name to a new name
                 echo "> namefix: $NMS changed to $NNMS"
             fi  
           done
          fi
       ;;
     c)                                                          # flag for chanching names to lowercases
      if [[ "$PWD" == "$HOME" ]]; then                           # prevents changes in home directory
        echo "> namefix warn: you are at home"                  
      else
        for NMS in *;do                                          # loops throught files/directories names
          if [[ $NMS =~ [[:upper:]] ]]; then                     # checks for uppercases
            NNMS=$(echo $NMS | tr '[:upper:]' '[:lower:]')      
            mv "$NMS" "$PWD/$NNMS"                               # changes uppercase to lowercases
            echo "> namefi: $NMS changed to $NNMS"
          fi
        done
      fi
    ;;
    \?)                                                         # handle wrong flags
        echo "script usage : namefix [-s] [-c]"
        
        ;;
    esac
  done
}
