#!/bin/bash
#
#	FoF Map Preview Thumbnails Installer ...
#	------------------------------------
#	First created on:  2026-02-18, by: Weasel (STEAM_0:1:155)
#	Last updated on:   2026-02-18, by: Weasel (STEAM_0:1:155)
#
echo -E "=====================================================================";
echo -E "Download and install an archive of map review thumbnails for custom/";
echo -E "3rd-party maps for use in echo the Fistful of Frags (FoF) Highlighted";
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
#	Ensure the the proper folder/sub-directory structure exists ...
#
mkdir materials 2> /dev/null > /dev/null;
mkdir materials/vgui 2> /dev/null > /dev/null;
mkdir materials/vgui/maps 2> /dev/null > /dev/null;
#
#	Change to the proper folder/sub-directory ...
#
cd materials/vgui/maps;
#
#	Download the map preview thumbnail library ...
#
echo -E "-------------------------------------------------"
echo -E "1. Downloading the thumbnails archive ...";
echo -E "-------------------------------------------------";
curl -O https://raw.githubusercontent.com/Mecha-Weasel/fof-map-preview-thumbnail-archive/refs/heads/main/FoF-Map-Thumbnails-Latest-GameServer.zip;
#
#	Apply the map preview thumbnail library ...
#
echo -E "-------------------------------------------------";
echo -E "2. Extracting the thumbnails archive ...";
echo -E "-------------------------------------------------";
unzip -o FoF-Map-Thumbnails-Latest-GameServer.zip;
#
#	Deleting cached thumbnails archive ...
#
echo -E "-------------------------------------------------";
echo -E "3. Deleting the cached thumbnails archive ...";
echo -E "-------------------------------------------------";
rm FoF-Map-Thumbnails-Latest-GameServer.zip;
#
#
#	List resultant folder contents ...
#
echo -E "-------------------------------------------------";
echo -E "4. Listing installed archive contents ...";
echo -E "-------------------------------------------------";
ls -lah;
#
#	If we got this far, assume everything finished corectly,
#	and display a message saying so ...
#
echo -E "=====================================================================";
echo -E "[x] FINISHED!  Additional map preview thumbnails should show in FoF.";
#
#	... that's all folks!
#
echo -E "=====================================================================";
cd ../../..;

