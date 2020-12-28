#!/bin/bash

##
# @author       Gareth Palmer
# @description  This script allows the @author to clone various projects for the purposes of development
# @version      1.0
##

clear

# Choose a project

while true 
do
    echo "Choose a project"
    echo "1.\tLourie Registration System"
    echo "2.\tAlbatross School Counsellor Booking System"
    echo "3.\tActive Directory Tools"
    echo "4.\tMarks Email System"
    echo "4.\tLinux New System"
    read -p "Choice: " uri_choice
    case ${uri_choice} in
        1)
        uri="@gitlab.com/projector22/lourie-registration-system.git"
        project_name="lourie-registration-system"
        break
        ;;

        2)
        uri="@gitlab.com/projector22/albatross-school-counsellor-booking-system.git"
        project_name="albatross-school-counsellor-booking-system"
        break
        ;;

        3)
        uri="@gitlab.com/projector22/active-directory-tools.git"
        project_name="active-directory-tools"
        break
        ;;

        4)
        uri="@gitlab.com/projector22/marks-email-system.git"
        project_name="marks-email-system"
        break
        ;;

        5)
        uri="@github.com/projector22/linux-new-system.git"
        project_name="linux-new-system"
        break
        ;;

        *)
        echo "\nInvalid choice..."
    esac
done

# Choose a folder

while true 
do
    echo "\nClone into current folder or into the project's own folder"
    echo "1.\tCurrent folder (${PWD})"
    echo "2.\tProject folder (${PWD}/${project_name})"
    read -p "Choice: " folder_choice
    case ${folder_choice} in
        1)
        folder=" ."
        break
        ;;

        2)
        folder=""
        break
        ;;

        *)
        echo "\nInvalid choice..."
    esac
done

# Get the ssh key

sshkey=""

case $1 in
    -k | --key)
    ssh_key="$2"
    ;;
esac

if test -z "$ssh_key"
then
    echo "Please enter your SSH Key:"
    read ssh_key
fi

echo "\nExecuting command"
echo "https://projector22:${ssh_key}${uri}${folder}"

# Execute the clone

git clone https://projector22:${ssh_key}${uri}${folder}