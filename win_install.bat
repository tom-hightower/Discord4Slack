::
::	Discord4Slack Windows Automatic Installer!
::	Created by Tom Hightower, 2018 (v0.9)
::
@echo off
setlocal

echo Discord4Slack Windows Installer!     (v0.9)

SET @interopPath=%localappdata%\Slack\
SET @newPath=0

FOR /D %%G in ("%@interopPath%app*") DO SET @newPath=%%G\resources\app.asar.unpacked\src\static\

if %@newPath% neq 0 goto foundFile

echo No Slack App folder found.  If you have Slack installed from the MS Store please install Discord4Slack manually
exit

:foundFile
SET @interopPath=%@newPath%
SET @interopFile=%@interopPath%ssb-interop.js
SET @interopTemp=%@interopPath%.ssb-interop.js
find /c "/Discord4Slack start/" %@interopFile%
if %errorlevel% equ 1 goto notfound

rem Get start and end line numbers of the unwanted section
set start=
(for /F "delims=:" %%a in ('findstr /N "start// end//" %@interopFile%') do (
   if not defined start (
      set start=%%a
   ) else (
      set end=%%a
   )
))

rem Copy all lines, excepting the ones in start-end section
(for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %@interopFile%') do (
   if %%a lss %start% echo(%%b
   if %%a gtr %end% echo(%%b
)) > %@interopTemp%
type %@interopTemp% > %@interopFile%
del %@interopTemp%

:notfound
echo //Discord4Slack start// >> %@interopFile%
type Discord4Slack.js >> %@interopFile%
echo //Discord4Slack end// >> %@interopFile%

echo                                                                    #######    
echo                                                                   #########            
echo                                                      ##           ##########    ##       
echo                                                   ########         ##################  
echo         # #                   # #                 ########          ##################  
echo       # #     # # # # # # #     # #               #########   #####################  
echo     # # # # # # # # # # # # # # # # #              ################################         
echo     # # # # # # # # # # # # # # # # #            ##############################     
echo     # # # # # # # # # # # # # # # # #        ################################    
echo   # # # # # # # # # # # # # # # # # # #     ###################      #########   
echo   # # # # # # # # # # # # # # # # # # #     ################         ##########     
echo   # # # # #     # # # # #     # # # # #       ####### #########         ##################  
echo   # # # #         # # #         # # # #               ##########         ################## 
echo # # # # #         # # #         # # # # #              #########    ####################### 
echo # # # # # #     # # # # #     # # # # # #               ##################################  
echo # # # # # # # # # # # # # # # # # # # # #               ############################# 
echo # # # # # # # # # # # # # # # # # # # # #          #################################   
echo # # # # #     # # # # # # #     # # # # #         ######################    #########   
echo     # # # #                   # # # #             ##################         #########   
echo       # # # #               # # # #               ##################         ########   
echo                                                             #########   
echo                                                             #########    
echo                                                               ######     

echo Done!  Reload Slack to see changes
