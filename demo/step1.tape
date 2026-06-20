# Step 1 — sweep.  vhs demo/step1.tape
Output "assets/step-1-sweep.gif"
Set Shell "bash"
Set FontSize 15
Set Theme "Catppuccin Mocha"
Set Padding 22
Set TypingSpeed 28ms
Set Width 1180
Set Height 380

Hide
Type "source demo/rs-init.sh && clear"
Enter
Show
Sleep 500ms
Type "# sweep every repo under a folder, ranked by rot"
Enter
Sleep 900ms
Type "rotscan --all ."
Sleep 350ms
Enter
Sleep 4800ms
