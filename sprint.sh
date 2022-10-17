sprint()
{
 flag_n='false'
 flag_w='false'
 flag_p='false'
 if [[ $# -lt 1 ]]; then
   echo 'script usage:'
   echo 'sprint -[p/n/w <week number>] -r <line> -u -[s/a <task>]'
 fi
 # Triggers when no SPRINT_PATH variable exists
 if [[ -z "${SPRINT_PATH}" ]]; then 
    # Creates new sprint_file
      touch sprint_file
      export SPRINT_PATH=$PWD/.sprint
 else
   CURRENT_WEEK=$(date +"%U") #Gets current week
	   while getopts "upcda:sr:nw:" FLAGS; do #Collets flags 
	    case "$FLAGS" in
            p) # Swith to the previous week
               flag_p='true'
               ((CURRENT_WEEK -=1)) ;;
	    w) # Allows to chose a week
	      flag_w="true"
              CURRENT_WEEK=${OPTARG} ;;
	    n) # Switch to the next week
	      flag_n="true"
              ((CURRENT_WEEK += 1)) ;;
	    a) # Adds a new task 
	        echo "Week $CURRENT_WEEK : ${OPTARG}" >> $SPRINT_PATH
	        echo "sprint: task added to week $CURRENT_WEEK" ;;
	    s) #Shows current week 
              echo "Line : Week : Task"
	      grep $CURRENT_WEEK  $SPRINT_PATH -n ;;
	    r) #Removes tasks based on the line
	      LINE=$2'd'
	      echo "sprint: removing task at the line $2"
	      sed -i "$LINE" "$SPRINT_PATH" ;;
            d) # Delets the week
              echo "Do you want to delete all tasks from $CURRENT_WEEK ?"
              read ACTION
              if [[ $ACTION == 'y' ]]; then  
              sed -i "/\b\(Week $CURRENT_WEEK\)\b/d" "$SPRINT_PATH"
              echo "Delete all tasks from $CURRENT_WEEK"
              fi ;;
	    u) # Moves tasks from a previous to the current
	       PREV_WEEK=$(date +"%U")
	       ((PREV_WEEK -= 1))
	       echo $CURRENT_WEEK
	       grep 'Week $PREV_WEEK :' $SPRINT_PATH | xargs sed -i "s/Week $PREV_WEEK :/Week $CURRENT_WEEK :/g" "$SPRINT_PATH"
	      ;;
	    *)
	      echo 'sprint -[p/n/w <week number>] -r <line> -u -[s/a <task>]'
	   esac   
 	done
 fi
 if $flag_n && $flag_w && $flag_p; then
    echo "Wrong flag combination"   
 fi
}
