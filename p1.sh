#!/bin/bash
choice=0

while [ "$choice" -lt 6 ]
do
echo -e  "\n------------------------------------------------------------------------------------------------------------------------------"
echo -e "Choose one of the Following\n1. Create a New Address Book\n2. View Records\n3. Insert new Record\n4. Delete a Record\n5. Modify a Record\n6. Exit"
echo -e  "------------------------------------------------------------------------------------------------------------------------------\n"
echo  "Enter your choice : "
read choice

case $choice in
"1")  echo  "Choice $choice : Create a New Address Book"
      echo  "Enter the name of file to create"
      read filename 
      touch $filename
      echo -e "name \t number \t address" | cat >> $filename
;;
"2")  echo  "Choice $choice : View Records"
      echo  "Enter the name of file"
      read filename  
      cat $filename
;;
"3")  echo  "Choice $choice : Insert new Record"
      echo  "Enter the name of file"
      read filename  

      flag=1
      while [ "$flag" -gt 0 ]
      do
      echo "Enter Name"
      read name
      echo "Enter Phone Number of $name"
      read number
      echo "Enter Address of $name"
      read address
      echo -e "$name \t $number \t $address" | cat >> $filename
      echo "Enter 0 to Stop, 1 to Enter next"
      read  flag
      done
;;
"4")  echo  "Choice $choice : Delete a Record"
      echo  "Enter the name of file"
      read filename 
      echo "Delete record : Enter Name/Phone Number"
      read pattern
      temp="temp"
      grep -v $pattern $filename | cat >> $temp 
      rm $filename
      cat $temp | cat >> $filename
      rm $temp

;;
"5")  echo  "Choice $choice : Modify a Record"
      echo  "Enter the name of file"
      read filename 
      echo "Modify record : Enter Name/Phone Number"
      read pattern
      temp="temp"
      grep -v $pattern $filename | cat >> $temp
      rm $filename
      cat $temp | cat >> $filename
      rm $temp
      echo "Enter Modified Name"
      read name
      echo "Enter Modified Phone Number of $name"
      read number
      echo "Enter Modified Address of $name"
      read address
      echo -e "$name \t$number \t$address" | cat >> $filename
;;
"6")  echo "Exiting..."
;;
*)  echo"Wrong choice"
;;
esac

done
