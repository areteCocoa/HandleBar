#!/bin/python
# omnifocus-pomo.py

import zipfile
import xml.etree.ElementTree as ET
import os

os.chdir("/Users/evilflyingtoaster/Library/Containers/")
os.chdir("com.omnigroup.OmniFocus2.MacAppStore")
os.chdir("Data")
os.chdir("Library")
os.chdir("Application Support")
os.chdir("OmniFocus/Backups/")

files = os.listdir(".")
files = [(file[10:27], file) for file in files]

new_files = list()
for (filetime, f) in files:
    try:
        new_filetime = {
            "year" : int(filetime[:4]),
            "month" : int(filetime[5:7]),
            "day" : int(filetime[8:11]),
            "hour" : int(filetime[11:13]),
            "minute" : int(filetime[13:15]),
            "second" : int(filetime[15:17])
        }
        new_files.append((new_filetime, f))
    except:
        pass
files = new_files

s = None
for (filetime, f) in files:
    if s is None:
        s = (filetime, f)
    else:
        # Figure out which one is sooner
        increments = ["year", "month", "day", "hour", "minute", "second"]
        for i in increments:
            cur = s[0][i]
            new = filetime[i]
            if cur < new:
                s = (filetime, f)
                break

newest_backup = s[1]

print("Newest backup found named '%s'" % newest_backup)

os.chdir(newest_backup)

# Find the zip file
z_file_name = list()
for item in os.listdir("."):
    ext = item[-3:]
    if ext == "zip":
        z_file_name.append(item)
        print("Found .zip file named '%s'" % item)
        
for z_file in z_file_name:
    # Unzip the file
    print("Unzipping '%s'" % z_file)
    zip_ref = zipfile.ZipFile(z_file, 'r')
    contents = zip_ref.open("contents.xml", "r")

    # Create a new tree from the contents
    xml_tree = ET.XML(contents.read())

    # Read all the children
    # TODO: Figure out what they mean
    for child in xml_tree:
        print child.tag

    zip_ref.close()

