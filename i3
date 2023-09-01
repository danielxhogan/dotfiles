# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

set $mod Mod4

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+q exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# Suspend
bindsym $mod+Shift+period exec systemctl suspend

# terminal shortcuts
bindsym $mod+Return exec alacritty
bindsym $mod+m exec alacritty -e tmux new -s Mane -n Terminator
bindsym $mod+n exec alacritty -e tmux new -s Audi -n Terminator
bindsym $mod+v exec alacritty -e tmux new -s Reefer -n Terminator
bindsym $mod+b exec alacritty -e tmux new -s Background -n Terminator

bindsym $mod+Shift+m exec alacritty -e tmux a -t Mane
bindsym $mod+Shift+n exec alacritty -e tmux a -t Audi
bindsym $mod+Shift+v exec alacritty -e tmux a -t Reefer
bindsym $mod+Shift+b exec alacritty -e tmux a -t Background

# app shortcuts
bindsym $mod+c exec code
bindsym $mod+g exec google-chrome

bindsym $mod+y exec slack
bindsym $mod+u exec spotify
bindsym $mod+i exec discord
bindsym $mod+o exec brave --incognito
bindsym $mod+p exec postman

bindsym $mod+d exec --no-startup-id dmenu_run
bindsym $mod+s exec gnome-control-center
bindsym $mod+a exec nautilus

# kill focused window
bindsym $mod+q kill

# color scheme
set $background #000b1e
set $green #5a8f7b
set $turquoise #18978f
set $purple #7a4069
set $deepred #a10035
set $orange #ef5b0c
set $lightpink #ffc0cb
set $hotpink #ff69b4
set $neonblue #34e2e2
set $white #d7d7d5

# borders
default_border pixel 5
font pango:monospace 14

# set some nice colors      border             background       text
client.focused              $green             $deepred         $background
client.unfocused            $background        $background      $green
client.focused_inactive     $turquoise         $turquoise       $lightpink
client.urgent               $orange            $orange          $background

# i3bar
bar {
        status_command i3status
        separator_symbol " x "
        font pango:monospace 12

        colors {
                background $background
                statusline $neonblue
                separator $orange

                #                       border          background      text
                focused_workspace       $background     $turquoise      $deepred
                inactive_workspace      $lightpink      $lightpink      $green
                urgent_workspace        $background     $deepred        $neonblue
        }
}

# layout
bindsym $mod+f fullscreen toggle

bindsym $mod+t layout tabbed
bindsym $mod+w layout stacking
bindsym $mod+e layout toggle split

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Media player controls
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# names for default workspaces
set $ws0 " 0::[] "
set $ws1 " 1::[] "
set $ws2 " 2::[] "
set $ws3 " 3::[] "
set $ws4 " 4::[] "
set $ws5 " 5::[] "
set $ws6 " 6::[] "
set $ws7 " 7::[] "
set $ws8 " 8::[] "
set $ws9 " 9::[] "
set $ws10 "10"
set $ws11 "11"

# switch to workspace
bindsym $mod+0 workspace number $ws0
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+z workspace number $ws10
bindsym $mod+x workspace number $ws11

# move focused container to workspace
bindsym $mod+Shift+0 move container to workspace number $ws0
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+z move container to workspace number $ws10
bindsym $mod+Shift+x move container to workspace number $ws11

# resize
bindsym $mod+r mode "resize"

mode "resize" {
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+Shift+z mode "default"
}

# floating
floating_modifier $mod

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# split in horizontal orientation
bindsym $mod+Shift+e split h

# split in vertical orientation
bindsym $mod+Shift+w split v

# focus the parent container
bindsym $mod+Shift+p focus parent

# focus the child container
#bindsym $mod+d focus child