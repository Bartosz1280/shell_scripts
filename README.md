# Shell scripts

Shell script I made to make work in/with terminal easier. The easiest way to use them is to add them to your .bashrc/.zshrc .

Currently avaible scripts:

 * **namefix** - change uppercase letters to lowercase and/or remove spaces in files and directory names in pwd </li>
 * **sprint** - helps to manage your weekly sprint by creating a list of tasks that need to be done </li>


## namefix

Browsing files/directories with uppercase latters and spaces in their names might be annoying. At the same time manual changing of each name is time consuming. To avoid all of that I made a script that changes all files and directories names in your pwd.

Usage:
**namefix -cs**
* c - remove capital letters
* s - remove spaces

**sprint -[p/n/w <week number>] -r <line> -u -[s/a <task>]**
* p - present week
* n - next week
* w - specified week (ex.42)
* r - remove task from line
* u - update your current week with uncompleted tasks from previous week
* s - show task (by deafult current week). When combined with -p/n/w flags shows tasks from another week
* a - adds a new task (by default to current week). When combined with -p/n/w flags adds tasks to another week

All tasks are stored in .sprint file created and updated by the function
