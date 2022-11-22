# https://github.com/charmbracelet/vhs#vhs

# Output
Output quickstart.mp4
Output quickstart.webm

# Settings
Set FontSize 22
Set Framerate 24
Set Height 576
Set Padding 28
Set Width 1024

# Initial pause
Sleep 2

# Commands
Type "hugo new site quickstart"
Sleep 1
Enter
Sleep 2

Type "cd quickstart"
Sleep 1
Enter
Sleep 2

Type "git init"
Sleep 1
Enter
Sleep 2

Type "git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke"
Sleep 1
Enter
Sleep 4

Type `echo "theme = 'ananke'" >> config.toml`
Sleep 1
Enter
Sleep 2

Type "hugo server"
Sleep 1
Enter

# Final pause
Sleep 5
