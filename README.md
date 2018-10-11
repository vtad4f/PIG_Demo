# PIG_UDF

### Importing Project:
* Open “eclipse”, right click on “Package Explorer” window, click import.
* Select “Git”-> “Projects from Git” and click “next”.
* Select “clone url” and click “next”.
* Paste “https://github.com/shudipdatta/PIG_UDF.git” in the “url” textbox, Change protocol to “git”, and click “next”. 
* Choose “Import existing project” and click “finish”.

### Referencing libraries:
* Right click on project and select “build path”-> “configure build path” ->”libraries”->”add external jars”.
* Go to the directory “File System/usr/lib/hadoop” and select ‘hadoop-common.jar’
* Go to the directory “File System/usr/lib/hadoop/lib” and select ‘common-logging-1.1.1.jar’
* Go to the directory “File System/usr/lib/pig” and select ‘pig.jar’
* Click “Ok”.
  
### General Information (Cloudera):

* Operating System:         Mac -> Microsoft Remote Desktop, Windows -> Default Remote Desktop, Ubuntu -> Remmina
* Machine:                  cqs-cs6304-xxx.ats.mst.edu
* User:                     cloudera
* Default Password:         stu-pass
* Change Password Command:  sudo passwd cloudera

* "Firefox already running" error solve by command:     killall -SIGTERM firefox
* "Eclipse workspace in use" error solve by command:
* cd ~/yourWorkspaceDirectory/.metadata
* rm .lock
