# lilith

The app was developed out of boredom and some laziness. I just wanted to keep track of some basic statistics of my car.
Since I hate all the hyper-connected apps that need a sh*tload of permissions, I designed this one to be pure "offline".

I kept an eye on performance ;)

It is powered by HiveDB, which is a charm to work with.

## Important information

 - I am not a developer at all
 - None of the code is "perfect" and far from done
 - I am open to any improvement, but I have very limited time
 - This repo is actually just for me but if someone wants to run the app: you are welcome to do so :)
 - I just created some dummy backgrounds because I do not own any rights to car brand logos and vehicle designs, just replace the round shape with your logo of choice and the wireframe with an actual model

## Basic usage

If you start the app everything is organized in buttons that are "language agnostic".

- Main screen
  -  Add entry (gas, spent money, distance)
  - Add maintenance date
  - See statistics
  - Go to settings
- Settings screen
  - Set license plate no. (I wanted it displayed on the main screen)
  - See general entries for editing/deleting
  - See maintenance entries for editing/deleting
  - Change colors (_amber, blue, white, green, red_)
  - Create a backup
    - the backup file can only be created on Android (thanks Apple), due to the path_provider plugin
    - the file gets saved to your internal data on: android/data/com.example.balthasar/files/lilith_backup_[timestamp].csv

## Feature TODOs

- ~~backup of HiveDB~~ done but only for Android (iOS does not get the "getExternalStorageDirectory() from path_provider)
- add charts for monthly statistics
- ~~add maintenance widgets~~ (shout out to: Riccardo :D)
- optional: add some more languages that can be set in the settings menu

## Preview (red)

- Main screen

![Main Screen](screenshots/main-screen.png)

 - Edit screen (add entry)

![Edit Screen](screenshots/entry-screen.png)

- Settings screen

![Settings Screen](screenshots/settings-screen.png)

 - Info screen

 ![Info Screen](screenshots/info-screen.png)

 - Database edit screen

 ![DB edit Screen](screenshots/edit-db-screen.png)

 - Maintenance edit screen

 ![Maintenance edit Screen](screenshots/maint-list.png)

 - Maintenance add screen

 ![DB edit Screen](screenshots/maintenance.png)