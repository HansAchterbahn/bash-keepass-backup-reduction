#!/bin/env zsh

# This script reduces all files with the string
#   - "daily"
#   - "weekley"
#   - "monthly"
#   - "yearly"
# to max. 7 files of a kind. Alle remaning files will be deleted

# User Settings ################################################################

type=("daily" "weekly" "monthly" "yearly")    # array with search strings
keep=7                                        #ammount of files to keep

################################################################################

len=${#type[*]}               # variable with length of the search string array


# Loop through types
#   1. list all files in the actual folder
#   2. searche for files with the actual type in theier name
#   3. select all without the last 7 files (the newest ones)
#   4. if files are found remove all selected files
for (( i=1 ; i<$len+1 ; i++ )) do
  remove=(`ls | grep ${type[$i]} | head --lines=-$keep`)    # search for files with search string without the last 7 files and store them in an array
  remove_len=${#remove[*]}                                  # get array length

  if [ $remove_len -gt 0 ];                                 # if array length is greater than 0
  then                                                      # do
    echo -n "Type $type[i]:\t Remove $remove_len items"     #   echo amount of files to remove
    rm $remove                                              #   remove found files
    echo "- done"                                           #   acknowledge remove action
  else                                                      # else
    echo "Type $type[i]:\t Nothing to remove"               #   echo "Nothing to remove"
  fi

done
