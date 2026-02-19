#!/bin/bash
#
#	FoF Map Preview Thumbnails Uninstaller ...
#	--------------------------------------
#	First created on:  2026-02-18, by: Weasel (STEAM_0:1:155)
#	Last updated on:   2026-02-18, by: Weasel (STEAM_0:1:155)
#
echo -E "=====================================================================";
echo -E "Uninstall map preview thumbnails for custom/3rd-party maps previously"
echo -E "installed for use in the Fistful of Frags (FoF) Highlighted";
echo -E "Server Browser (HSB) feature.";
#
#	Validate that the current folder contains the
#	Fistful of Frags (FoF) installation ...
#
#	Check that the steam.inf file is here ...
#
if [ ! -f "steam.inf" ]; then
	#
	#	If the steam.inf file is not found,
	#	display an error message and exit ...
	#
	echo -E "=====================================================================";
	echo -E "[_] ERROR: steam.inf file NOT found!!!";
	echo -E "---------------------------------------------------------------------";
	echo -E "This probably means that you did not download the script into the";
	echo -E "correct location.  It MUST be downloaded to the "fof" sub-folder";
	echo -E "where Fistful of Frags is installed.  This folder is typically:";
	echo -E "/home/$USER/.steam/debian-installation/steamapps/common/Fistful of Frags/fof";
	echo -E "This script will now exit ...";
	echo -E "=====================================================================";
	exit 1;
fi;
#
#	If the steam.inf file IS found,
#	display a message saying so ...
#
echo -E "=====================================================================";
echo -E "[x] NOTICE: steam.inf file found. Contents of steam.inf file ...";
cat steam.inf | more;
#
#		Validate that the steam.inf file contains the
#		correct Steam AppID for Fistful of Frags (FoF) ...
#
echo -E "=====================================================================";
STEAMINF_FILE="./steam.inf";
dos2unix $STEAMINF_FILE;
source "$STEAMINF_FILE";
AppID_Expected="265630";
echo -E "AppID Expected:  $AppID_Expected";
echo -E "AppID Found:     $appID";
if [[ "$appID" != "$AppID_Expected" ]]; then 
	#
	#		If the correct Steam AppID (265630) is NOT found,
	#		display an error message and exit ...
	#
	echo -E "=====================================================================";
	echo -E "[_] ERROR: Correct AppID (265630) NOT found in steam.inf file!!!";
	echo -E "---------------------------------------------------------------------";
	echo -E "This probably means that you did not download the script into the";
	echo -E "correct location.  It MUST be downloaded to the "fof" sub-folder";
	echo -E "where Fistful of Frags is installed.  This folder is typically:";
	echo -E "/home/$USER/.steam/debian-installation/steamapps/common/Fistful of Frags/fof";
	echo -E "This script will now exit ...";
	echo -E "=====================================================================";
	exit 1;
fi;
#
#		If the correct Steam AppID (265630) IS found,
#		display a message saying so ...
#
echo -E "=====================================================================";
echo -E "[x] NOTICE: Correct AppID (265630) found in steam.inf file.";
#
#	Deleting all custom HSB thumbnails ...
#
echo -E "------------------------------------------------";
echo -E "1. Deleting custom map preview thumbnails ...";
echo -E "------------------------------------------------";
rm -f materials/vgui/maps/*.vtf 2> /dev/null > /dev/null;
rm -f materials/vgui/maps/*.vmt 2> /dev/null > /dev/null;
#
#	List resultant folder contents ...
#
echo -E "------------------------------------------------";
echo -E "2. List folder contents ...";
echo -E "------------------------------------------------";
ls -lah materials/vgui/maps;
#
#	If we got this far, assume everything finished corectly,
#	and display a message saying so ...
#
echo -E "=====================================================================";
echo -E "[x] FINISHED!  Custom map preview thumbnails should be gone.";
#
#	... that's all folks!
#
echo -E "=====================================================================";

