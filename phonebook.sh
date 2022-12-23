#!/bin/bash
echo "Welcome to Phonebook ^_^ Write our command " 
#Take user option
read -p "" command
#Switch condition to switch between user options
case $command in
"")
echo "phonebook avalibale option"
echo "phonebook -i" ,"Insert new content name and number"
echo "phonebook -v" ,"View all saved contacts details"
echo "phonebook -s" ,"search by contant name in the phonebook database"
echo "phonebook -e" ,"Delet all Records in the phonebook database "
echo "phonebook -d" ,"Delet one contact name in the phonebook database"
sh phonebook.sh;;

#--------------------------------------------------------------------#
#--------------Insert new content name and number--------------------#
#--------------------------------------------------------------------#
"phonebook -i")
echo "Add contact"
read -p "Insert new cntact Name" c_Name
# Check if Name exist or not ?
if grep $c_Name phonebook_data.txt
then
echo "Name taken befor try with another name"
sh phonebook.sh
else
read -p "Insert new cntact number" c_Phone
echo "Name:"$c_Name,"Phone:"$c_Phone>>phonebook_data.txt
echo "Contact (Name:$c_Name,Phone:$c_Phone)added successfuly " 
sh phonebook.sh
fi;;
#--------------------------------------------------------------------#
#--------------View all saved contacts details-----------------------#
#--------------------------------------------------------------------#
"phonebook -v")
cat phonebook_data.txt
sh phonebook.sh;;

#--------------------------------------------------------------------#
#-----------search by contant name in the phonebook data base--------#
#--------------------------------------------------------------------#
"phonebook -s")
read -p "Enter cntact Name" c_Name
#Check if Name exist or not ?
if grep $c_Name phonebook_data.txt
then
cat |grep $c_Name  phonebook_data.txt 
else
echo "Wrong\!Wrong\!Wrong!"
echo "$c_Name not found in your contacts"
fi
sh phonebook.sh;;
#--------------------------------------------------------------------#
#--------Delet all Records in the phonebook database ----------------#
#--------------------------------------------------------------------#
"phonebook -e")
rm ./phonebook_data.txt 
touch ./phonebook_data.txt 
sh phonebook.sh;;

#--------------------------------------------------------------------#
#-----------Delet one contact name in the phonebook database---------#
#--------------------------------------------------------------------#
"phonebook -d")
read -p "Enter cntact Name" c_Name
#sed -i /'Hassan/c\' f.txt
#sed -i /'$(c_Name)/c\' phonebook_data.txt 
#sed -i $c_Name phonebook_data.txt
if grep $c_Name phonebook_data.txt
then
sed -i "/$c_Name/d" phonebook_data.txt 
echo "$c_Name contact is deleted successfuly"
else
echo "Wrong\!Wrong\!Wrong!"
echo "$c_Name not found in your contacts"
fi
sh phonebook.sh;;

esac
