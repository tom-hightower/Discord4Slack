#! /usr/bin/env bash

#   Discord4Slack multi-platform Automatic Installer!
#   (Complete with fake progress bar so it looks like stuff is progressing)
#   Created by Tom Hightower, 2018 (v3.0.1)
#   Credit to Kevin Smithson for the multi-platform and restore support!

REVERT=false

while test $# -gt 0; do
  case "$1" in
    --uninstall)
      REVERT=true
      shift
      ;;
    *)
      break
      ;;
  esac
done

JS_START="//### Discord4Slack start auto-generated line (Don't remove pls) ###"
JS_END="//### Discord4Slack end auto-generated line (Don't remove pls) ###"

JS="
${JS_START}
document.addEventListener('DOMContentLoaded', function() {
  // Fetch our CSS in parallel ahead of time
  const cssPath = 'https://raw.githubusercontent.com/tom-hightower/Discord4Slack/master/src/discordTheme.css';
  let cssPromise = fetch(cssPath).then((response) => response.text());
  // Insert a style tag into the wrapper view
  cssPromise.then((css) => {
    let s = document.createElement('style');
    s.type = 'text/css';
    s.innerHTML = css;
    document.head.appendChild(s);
  });
});
${JS_END}"

MAC_SLACK_RESOURCES_DIR="/Applications/Slack.app/Contents/Resources"
LINUX_SLACK_RESOURCES_DIR="/usr/lib/slack/resources"

if [[ -d $MAC_SLACK_RESOURCES_DIR ]]; then SLACK_RESOURCES_DIR=$MAC_SLACK_RESOURCES_DIR; fi
if [[ -d $LINUX_SLACK_RESOURCES_DIR ]]; then SLACK_RESOURCES_DIR=$LINUX_SLACK_RESOURCES_DIR; fi
if [[ -z $SLACK_RESOURCES_DIR ]]; then
  # Assume on windows if the linux and osx paths failed.
  # Get Windows environment info:
  WIN_HOME_RAW="$(cmd.exe /c "<nul set /p=%UserProfile%" 2>/dev/null)"
  USERPROFILE_DRIVE="${WIN_HOME_RAW%%:*}:"
  USERPROFILE_MNT="$(findmnt --noheadings --first-only --output TARGET "$USERPROFILE_DRIVE")"
  USERPROFILE_DIR="${WIN_HOME_RAW#*:}"
  WIN_HOME="${USERPROFILE_MNT}${USERPROFILE_DIR//\\//}"

  APP_VER="$(ls -dt ${WIN_HOME}/AppData/Local/slack/app*/)"
  IFS='/', read -a APP_VER_ARR <<< "$APP_VER"

  SLACK_RESOURCES_DIR="${WIN_HOME}/AppData/Local/slack/${APP_VER_ARR[8]}/resources"
fi

SLACK_INTEROP_PATH="${SLACK_RESOURCES_DIR}/app.asar.unpacked/dist/ssb-interop.bundle.js"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is not installed. Please install from https://nodejs.org/en/download/ before continuing."
  exit 1
fi
if ! command -v npx >/dev/null 2>&1; then
  echo "npm is not installed. Please install before continuing."
  exit 1
fi

echo "This script may require sudo privileges."
echo ""
for i in {33..40}
do
   echo -ne "######                    ( $i%)\r"
   sleep .1
done

sudo npx asar extract ${SLACK_RESOURCES_DIR}/app.asar ${SLACK_RESOURCES_DIR}/app.asar.unpacked > /dev/null 2>&1

for i in {41..48}
do
   echo -ne "#######                   ( $i%)\r"
   sleep .1
done
sleep .1
echo -ne '############              ( 50%)\r'
echo -ne '#############             ( 51%)\r'

if [ "$REVERT" = true ]; then
  sudo sed -i.backup '1,/\/\/# sourceMappingURL=ssb-interop.bundle.js.map/!d' ${SLACK_INTEROP_PATH}
else
  sudo tee -a "${SLACK_INTEROP_PATH}" > /dev/null <<< "$JS"
fi

for i in {58..65}
do
   echo -ne "###############           ( $i%)\r"
   sleep .1
done

sudo npx asar pack ${SLACK_RESOURCES_DIR}/app.asar.unpacked ${SLACK_RESOURCES_DIR}/app.asar > /dev/null 2>&1

echo -ne '#################         ( 72%)\r'
sleep .2
echo -ne '###################       ( 87%)\r'
sleep .4
echo -ne '#######################   (100%)'
echo -ne '\n'
echo '                                                                   #######    '
echo '                                                                  #########            '
echo '                                                     ##           ##########    ##       '
echo '                                                  ########         ##################  '
echo '        # #                   # #                 ########          ##################  '
echo '      # #     # # # # # # #     # #               #########   #####################  '
echo '    # # # # # # # # # # # # # # # # #              ################################         '
echo '    # # # # # # # # # # # # # # # # #            ##############################     '
echo '    # # # # # # # # # # # # # # # # #        ################################    '
echo '  # # # # # # # # # # # # # # # # # # #     ###################      #########   '
echo '  # # # # # # # # # # # # # # # # # # #     ################         ##########     '
echo '  # # # # #     # # # # #     # # # # #       ####### #########         ################## ' 
echo '  # # # #         # # #         # # # #               ##########         ################## '
echo '# # # # #         # # #         # # # # #              #########    ####################### '
echo '# # # # # #     # # # # #     # # # # # #               ##################################  '
echo '# # # # # # # # # # # # # # # # # # # # #               ############################# '
echo '# # # # # # # # # # # # # # # # # # # # #          #################################   '
echo '# # # # #     # # # # # # #     # # # # #         ######################    #########   '
echo '    # # # #                   # # # #             ##################         #########   '
echo '      # # # #               # # # #               ##################         ########   '
echo '                                                            #########   '
echo '                                                            #########    '
echo '' 
echo 'Done!  Reload Slack to see changes (✿ ◠‿◠)'