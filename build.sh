#!/bin/sh

#=====================
# settings
#=====================

#ANE's name
ANEName="KKParseAnalytics.ane"

#build directory
buildDir="build"

#ActionScript directory and file
ASLibBinDir="ParseAnalyticsANEAS/bin"
ASLibSwcName="ParseAnalyticsANEAS.swc"

#default directory and file
DefaultBinDir="ParseAnalyticsANEDefault/bin"
DefaultSwcName="ParseAnalyticsANEDefault.swc"

#Ane directory in test project
TestAneDir="ParseAnalyticsANETest/ane"

#iOS static library directory in build directory
iOSDir="Release-iphoneos"

#iOS static library for simulator in build directory
#iOSSimDir="Release-iphonesimulator"

#iOS library（Third party）
iOSLib="iOSLib/Parse.framework"

#Android Project
#AndroidDir="xxxxx"

#Android directory in build directory
#AndroidBuildDir="android"

#directory for copy
#AndroidRes="res"

#path for adt tools
adt="/Applications/Adobe Flash Builder 4.7/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/AIRSDK/bin/adt"

#working directroy(you don't have to change it)
WorkingDir="workingdir"
#=====================

# copy AS lib
mkdir ${WorkingDir}

cp -f ${ASLibBinDir}/${ASLibSwcName} ${buildDir}

cp ${ASLibBinDir}/${ASLibSwcName} ${WorkingDir}
unzip -o ${WorkingDir}/${ASLibSwcName} -d ${WorkingDir}
#cp -f ${WorkingDir}/library.swf ${buildDir}/${AndroidBuildDir}
cp -f ${WorkingDir}/library.swf ${buildDir}/${iOSDir}
#cp -f ${WorkingDir}/library.swf ${buildDir}/${iOSSimDir}
rm ${WorkingDir}/*.*

# copy default 
cp ${DefaultBinDir}/${DefaultSwcName} ${WorkingDir}
unzip -o ${WorkingDir}/${DefaultSwcName} -d ${WorkingDir}
if [ ! -e ${buildDir}/default ]; then
    mkdir ${buildDir}/default
fi
cp -f ${WorkingDir}/library.swf ${buildDir}/default

# clean up
rm -r ${WorkingDir}


# copy android res directory
#if [ -e ${buildDir}/${AndroidBuildDir}/${AndroidRes} ]; then
#    rm -Rf ${buildDir}/${AndroidBuildDir}/${AndroidRes}
#fi
#cp -Rf ${AndroidDir}/${AndroidRes} ${buildDir}/${AndroidBuildDir}



# build

cd ${buildDir}

#adt command ========
"$adt" -package \
-target ane ${ANEName} extension.xml \
-swc ${ASLibSwcName} \
-platform iPhone-ARM \
  -platformoptions ios_options.xml \
  iOSLib/Parse.framework \
  -C ${iOSDir} . \
-platform default \
  -C default . 

#below comment out code is tempolary. not used.

#-platform Android-ARM \
#  -platformoptions android_options.xml \
#  -C android . \

#-platform iPhone-x86 \
#  -C ${iOSSimDir} . \




  
#================

cd ../

# copy to test directory
cp -f ${buildDir}/${ANEName} ${TestAneDir}

exit 0

