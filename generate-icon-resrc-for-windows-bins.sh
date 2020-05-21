#!/bin/sh

echo 'Generowanie pliku icon-resrc_windows.syso z icon.ico + windows-resrc.rc'
x86_64-w64-mingw32-windres ./windows-resrc.rc -o ./icon-resrc_windows.syso
echo 'Gotowe!'
