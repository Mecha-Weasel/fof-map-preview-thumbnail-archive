@echo off
rem
rem	FoF Map Preview Thumbnails Installer:
rem	------------------------------------
rem	First created on:  2026-02-18, by: Weasel (STEAM_0:1:155)
rem	Last updated on:   2026-02-18, by: Weasel (STEAM_0:1:155)
rem
:labelstartscript
echo =====================================================================
echo Download and install an archive of map review thumbnails for custom/
echo 3rd-party maps for use in echo the Fistful of Frags (FoF) Highlighted
echo Server Browser (HSB) feature.
rem
rem	Validate that the current folder contains the
rem	Fistful of Frags (FoF) installation ...
rem
rem		Check that the steam.inf file is here ...
rem
:labelchecksteaminf
IF NOT EXIST "steam.inf" GOTO labelsteaminfnotfound
IF EXIST "steam.inf" GOTO labelsteaminffound
rem
rem		If the steam.inf file is not found,
rem		display an error message and exit ...
rem
:labelsteaminfnotfound
echo =====================================================================
echo [_] ERROR: steam.inf file NOT found!!!
echo ---------------------------------------------------------------------
echo This probably means that you did not download the script into the
echo correct location.  It MUST be downloaded to the "fof" sub-folder
echo where Fistful of Frags is installed.  This folder is typically:
echo C:\Program Files (x86)\Steam\steamapps\common\Fistful of Frags\fof
echo This script will now exit ...
GOTO labelexitscript
rem
rem		If the steam.inf file IS found,
rem		display a message saying so ...
rem
:labelsteaminffound
echo =====================================================================
echo [x] NOTICE: steam.inf file found. Contents of steam.inf file ...
type steam.inf | more
rem
rem		Validate that the steam.inf file contains the
rem		correct Steam AppID for Fistful of Frags (FoF) ...
rem
:labelcheckappid
findstr /c:"appID=265630" steam.inf >nul
IF %ERRORLEVEL% EQU 0 (
		goto labelappidcorrect
	) ELSE (
		goto labelappidwrong
	)
rem
rem		If the correct Steam AppID (265630) is NOT found,
rem		display an error message and exit ...
rem
:labelappidwrong
echo =====================================================================
echo [_] ERROR: Correct AppID (265630) NOT found in steam.inf file!!!
echo ---------------------------------------------------------------------
echo This probably means that you did not download the script into the
echo correct location.  It MUST be downloaded to the "fof" sub-folder
echo where Fistful of Frags is installed.  This folder is typically:
echo C:\Program Files (x86)\Steam\steamapps\common\Fistful of Frags\fof
echo This script will now exit ...
GOTO labelexitscript
rem
rem		If the correct Steam AppID (265630) IS found,
rem		display a message saying so ...
rem
:labelappidcorrect
echo =====================================================================
echo [x] NOTICE: Correct AppID (265630) found in steam.inf file.
rem
rem	Ensure the the proper folder/sub-directory structure exists ...
rem
mkdir materials >nul
mkdir materials\vgui >nul
mkdir materials\vgui\maps >nul
rem
rem	Change to the proper folder/sub-directory ...
rem
cd materials\vgui\maps
rem
rem	Download the map preview thumbnail library ...
rem
echo -------------------------------------------------
echo 1. Downloading the thumbnails archive ...
echo -------------------------------------------------
curl -O https://raw.githubusercontent.com/Mecha-Weasel/fof-map-preview-thumbnail-archive/refs/heads/main/FoF-Map-Thumbnails-Latest-GameServer.zip
rem
rem	Apply the map preview thumbnail library ...
rem
echo -------------------------------------------------
echo 2. Extracting the thumbnails archive ...
echo -------------------------------------------------
powershell -command "Expand-Archive -Force FoF-Map-Thumbnails-Latest-GameServer.zip ."
rem
rem	Deleting cached thumbnails archive ...
rem
:labeldeletecache
echo ------------------------------------------------
echo 3. Deleting the cached thumbnails archive ...
echo ------------------------------------------------
del /f FoF-Map-Thumbnails-Latest-GameServer.zip
rem
rem
rem	List resultant folder contents ...
rem
:labellistfiles
echo -------------------------------------------------
echo 4. Listing installed archive contents ...
echo -------------------------------------------------
dir
rem
rem	If we got this far, assume everything finished corectly,
rem	and display a message saying so ...
rem
:labelfinished
echo =====================================================================
echo [x] FINISHED!  Additional map preview thumbnails should show in FoF.
rem
rem	... that's all folks!
rem
:labelexitscript
echo =====================================================================
cd ../../..
pause
ver

