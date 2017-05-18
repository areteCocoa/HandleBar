#!/bin/bash

spacec=$(kwmc query space list | wc -l)

# Get the active space id for later
active="$(kwmc query space active id)"

# Start json "headers"
printf "{\n"

# Number of spaces
printf "\t\"count\" : \"%s\",\n" $spacec

# Prepare for space information
printf "\t\"spaces\" : ["

# Get the array of spaces
spaces=()
i=0

while read -r line
do
    id=${line:0:1}
    a=0
    if (($id == $active))
	  then
		 a=1
    fi

    name=${line:3}
    if [ "$name" == "[no tag]" ]; then
	   name=$id
    fi

    # Start item
    printf "\n\t\t{"
    printf "\n\t\t\t\"id\" : \"%s\"," $id # id
    printf "\n\t\t\t\"name\" : \"%s\"," $name # name
    printf "\n\t\t\t\"activated\" : \"%s\"" $a # activated
    printf "\n\t\t}" # end

    #TODO: Check if there should be a comma and add one if there shuold be
    if [ $id != $spacec ]; then
	  printf ","
    fi
    
done <<< "$(kwmc query space list)"

# End spaces
printf "\n\t]\n"

printf "}"

exit

# TODO
## Get state of lock-to-container
# kwmc query lock-to-container
## Get state of standby-on-float
# kwmc query standby-on-float
## Get state of focus-follows-mouse
# kwmc query focus-follows-mouse
## Get state of mouse-follows-focus
# kwmc query mouse-follows-focus

# BEGIN { print "This is weird!" }
