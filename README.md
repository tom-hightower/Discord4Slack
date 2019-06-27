# Discord4Slack
## Make your Slack workspace look more like Discord!
### v2.3.0

### Automatic Installation Instructions
#### Step 1: Clone the repo and run the installer for your OS as root
- WINDOWS: run `win_install.bat`
- MAC: `sudo ./mac_install`
  - You may have to `chmod +x mac_install` first if it won't let you execute it
- Note: If you already have the theme manually installed, please remove it before running this installer. Once you have it installed with the installer, consecutive runs will automatically remove the old version before installing a new one

#### Step 2: Relaunch Slack
- Get confused by how much it looks like discord and how easy that was!

#### Step 3: ???

#### Step 4: Profit?

### Updating
Most updates are pulled in on Slack lauch.  On major version updates: If you installed via the automatic installer, just re-run the installer to update!  If you installed manually, just remove the old code and add the up-to-date version.

### Manual Installation Instructions
#### Step 1: Open src/ssb-interrupt.js in your slack installation in your favorite text editor 
- Path for Windows: `%AppData%\local\Slack\<your-version-here>\resources\app.asar.unpacked\src\static\ssb-interop.js` (note that if you installed slack via the Windows Store this file will be located somewhere else)
- Path for Mac: `/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js` (open as root)

#### Step 2: Add the code in `Discord4Slack.js` to the bottom of that file

#### Step 3: Relaunch Slack
- Get confused by how much it looks like discord

#### Step 4: ???

#### Step 5: Profit?

Note:  I'm not affiliated with Discord or Slack (Unless they're looking for a developer *hint hint*), I just really love both of these pieces of software :)
