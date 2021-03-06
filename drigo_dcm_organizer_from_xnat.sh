#!/bin/bash

#Rodrigo Perea
#rperea@kumc.edu (alternative email grandrigo@gmail.com)
#PLEASE ADD DESCRIPTION HERE:!!!!!!
#
#
#THIS SCRIPT WAS CREATED UNDER bash version 3.2 unders OSX 10.7. To check your bash version,
#enter bash --version
#Any questions please feel free to contact me at the email provided above.


SOURCE=$( pwd )

#Checking what you are doing.....
if  [ $1 = "--help" ] ; then
    echo " To organize the downoaded folders from XNAT (using ADEPT and SKyra for implementation) and 
organize it according to the size of each acquisition sequence within a +-10 range in MB 
The script will read each folde and assumes that the *dcm files are under $DIREC/* 
 "
    
    exit
fi


if  [ -z $1 ] ; then
    echo "Run --help for help or
          Please include the HSC# as the 1st argument.

Or --help for help  "
    exit
fi

for DIR in $(ls -1d $1* ) 
do
    echo "In $DIR ..."
    for SCAN in $( ls -1d $DIR/SCANS/* ) ; 
    do
#	echo "SCAN and DIR is $DIR/$SCAN "
#	echo $SIZE

	SIZE=$(du -sm $SOURCE/$SCAN/ | { read FIRST REST ; echo $FIRST; } )
	
	if [ $SIZE -gt 170 ] ; then

	    mkdir  -p DTI_dcm_${DIR}

	    echo "cp $SCAN/DICOM/*dcm ./DTI_dcm_${DIR}/"
	cp $SCAN/DICOM/*.dcm ./DTI_dcm_${DIR}		
	    echo "In scan sequence $SCAN with size $SIZE... " 
	fi

    done
done	
