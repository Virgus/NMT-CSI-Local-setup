# NMT-CSI-Local-setup
How to fix and run NMT CSI from a local repository

Hello,
after days struggling with my PopCorn Hour C-200 and reading the [NMTCSI main post](http://www.networkedmediatank.com/showthread.php?tid=33465), I've come up with a solution of most of the problems I've had so far.

My attention finally got caught by the names of the mount point "SATA_DISK_A3" I have on my unit (I proceeded to a full reset, format and used IP address instead of host name without success).

So I went to double check on cptjhmiller repository and saw that all [sata disks are referenced as "SATA_DISK"](https://github.com/cptjhmiller/NMTCommunitySoftwareInstaller/blob/master/HardwareTypes/HardwareDetailsFactory.cs) for most of the PCHs

I had to telnet into my C200 (no user and password needed for this unit) and execute:
```
mv SATA_DISK_A3 SATA_DISK 
mv /opt/sybhttpd/localhost.drives/SATA_DISK_A3 /opt/sybhttpd/localhost.drives/SATA_DISK
```

This was only the first part of the problem as many issues are related to NMT CSI repositories which are offline or not updated so here the instructions on how to have a local mock-up of all the repositories.
- Download [Rejetto portable http server](https://www.rejetto.com/hfs/?f=dl) and place it into NMTCommunityInstallerPortable folder
- Download the csi folder with all its content from the excellent [vaidyasr's repository](https://github.com/vaidyasr/nmtcsi) and place it into NMTCommunityInstallerPortable folder
- Download all the [csi-downloads](https://github.com/cptjhmiller/CSI/tree/master/) folder from cptjhmiller github and merge it with NMTCommunityInstallerPortable\csi\csi-downloads local folder
- Download all the modified files from this repository and replace those found in your local NMTCommunityInstallerPortable folder.
- Start HFS.exe and drag and drop onto its GUI the csi folder structure you have on the hard disk. You should see it in your browser at the http://localhost/csi url.

Now you can start "NMT Community Software Installer.exe" and use it without errors.

I've tweaked the files with particular attention to my C-200 unit, so you might need further tweaks to install other packets with other PCH models of yours.
