#!/bin/bash

#Rodrigo Perea
#rperea@kumc.edu (alternative email grandrigo@gmail.com)
#Created 10/30/2012
#Objective: 
#This script 

#PLEASE MAKE SURE YOU KNOW HOW TO USE IT BEFORE EXECUTE IT ````
#IT COULD MODIFIED YOUR FILES AND THERE IS NO UNDO OF IT!

#Objective: This script will get data from XNAT in dicom format and convert it to NIFTII in a 
#better more readable way for the user to submitt jobs to the cluster and to have an organized
#data in NIFTII format in the Alzheimer' Research Program at KU-MED
#Any questions please feel free to contact me at the email provided above.


#THIS WILL USE DCM2NII and NEEDS THE 11883_XX/DICOM format!!
#MAKE SURE YOU FORMAT AS IT LOOKS....

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#HERE IS AN EXAMPLE INPUT:
SOURCE=$( pwd )







########################################################################################
########################################################################################
#CODING PART TO CONVERT DICOM TO NIFTIIII
    
for DIR in $( ls -1d ./*_S_* ) ; 
do
echo "In directory $DIR ... "
#We will first move directories into a ./*/ structure....
mv $DIR/*/*/* $DIR/
rm -r $DIR/Axial*


#Here we will create the first NIFTII file to start within the folder
dcm2nii -g n $DIR/*



cp $DIR/*/*.nii ${DIR}.nii
cp $DIR/*/*.bval ${DIR}.bval
cp $DIR/*/*.bvec ${DIR}.bvec


#The filename will have its specific bvecs, bvals, niftii
#TDTIFILE=$( ls $DIR/*/*.nii )
#DTIFILE=$(basename $TDTIFILE)
#TBVAL=$( ls $DIR/*/*bval* )
#BVAL=$( basename $TBVAL )
#TBVEC=$( ls $DIR/*/*bvec* )
#BVEC=$( basename $TBVEC )

#----------------------------------------
#Eddy Correct the files.....
#THIS USUALLY HAS BEEN PREVIOUSLY DONE....
#echo "


#Eddy correcting $TDTIFILE ...."
#ECDTIFILE=${DIR}_DTIec.nii.gz
#echo "$TDTIFILE and $ECDTIFILE "
#eddy_correct $TDTIFILE $ECDTIFILE 0
#----------------------------------------

#Here we will create the brain mask and then we need to check them....

#echo "Creating masks for $DIR..."
#bet2 $ECDTIFILE ${DIR}_bet -m -f 0.35 
#Creating a filename for BETMASK...
#BETMASK=${DIR}_bet_mask


#Executing DTIFILEs
#echo "Dtifitting..... in $DIR" 
#dtifit  -k $ECDTIFILE -o $DIR -m $BETMASK -r $TBVEC -b $TBVAL






done


    
