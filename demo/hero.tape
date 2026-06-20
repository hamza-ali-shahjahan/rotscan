# Hero GIF — title card -> sweep -> drill -> fix.  Run from repo root: vhs demo/hero.tape
Output "assets/rotscan-hero.gif"
Set Shell "bash"
Set FontSize 15
Set Theme "Catppuccin Mocha"
Set Padding 22
Set TypingSpeed 28ms
Set Width 1180
Set Height 900

Hide
Type "source demo/rs-init.sh && clear"
Enter
Show
Sleep 500ms
Type "intro"
Sleep 300ms
Enter
Sleep 3800ms
Type "clear"
Enter
Sleep 300ms
Type "rotscan --all ."
Sleep 350ms
Enter
Sleep 4600ms
Type "clear"
Enter
Sleep 300ms
Type "rotscan checkout-api"
Sleep 350ms
Enter
Sleep 6200ms
Type "clear"
Enter
Sleep 300ms
Type "rotscan --fix checkout-api"
Sleep 350ms
Enter
Sleep 5200ms
Type "# survey -> drill -> clean.  nothing written without --apply."
Enter
Sleep 1200ms
Type "# find the rot, clean on purpose   |   born from Hamzaish"
Enter
Sleep 3200ms
