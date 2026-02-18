# fof-map-preview-thumbnail-archive
An archive of preview thumbnails for custom/3rd-party maps for use in the Fistful of Frags (FoF) Highlighted Server Browser (HSB)

A Work-In-Progress

Intented to eventually replace the equivalent functionality previously provided by https://github.com/Mecha-Weasel/spittoon/blob/main/FoF-Community-Map-Thumbnails-Update.md

Changes from the older system:
* No Windows binary executable (.exe file).
* The installer for Windows is just a "batch-file" (.cmd file).
* The uninstaller for Windows is also just a "batch-file" (.cmd file).
* No "elevated" or "administrative" permissions required for most users.
* Removed any depenencies on the old archive location (older github repo).
* The installer on Windows automatically downloads latest version of the archive from this github repo.
* To update an installation, just run the installation script again.
* An installation script for Linux (.sh file) is also planned.
* An uninstallation script for Linux (.sh file) is also planned.
* All scripts do some reality-checking to ensure they are being run from the proper location.
* All scripts should be downloaded into and executed from the "fof" folder INSIDE your FoF installation.

Installation locations:

* On Windows, the default Fistful of Frags location is typically:

	C:\Program Files (x86)\Steam\steamapps\common\Fistful of Frags

* On Windows, the location where you should download the scripts to is typically:
	
	C:\Program Files (x86)\Steam\steamapps\common\Fistful of Frags\fof
	
* On Linux Mint, the default Fistful of Frags location is typically:

	/home/$USER/.steam/debian-installation/steamapps/common/Fistful of Frags
	
* On Linux Mint, the location where you should download the scripts to is typically:
	
	/home/$USER/.steam/debian-installation/steamapps/common/Fistful of Frags/fof

