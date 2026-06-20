# Step 3 — fix.  vhs demo/step3.tape
Output "assets/step-3-fix.gif"
Set Shell "bash"
Set FontSize 15
Set Theme "Catppuccin Mocha"
Set Padding 22
Set TypingSpeed 28ms
Set Width 1180
Set Height 620

Hide
Type "source demo/rs-init.sh && clear"
Enter
Show
Sleep 500ms
Type "# fix on purpose: plan first, nothing written without --apply"
Enter
Sleep 900ms
Type "rotscan --fix checkout-api"
Sleep 350ms
Enter
Sleep 5200ms
