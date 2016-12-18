from i3pystatus import Status

status = Status(standalone=True)

color0 = "#303030"
color8 = "#5F5F5F"
color1 = "#c03000"
color9 = "#FF3A78"
color2 = "#8AB22C"
color10 = "#A6CD07"
color3 = "#B5C865"
color11 = "#fecf35"
color4 = "#426870"
color12 = "#4A7781"
color5 = "#6D506D"
color13 = "#FF3B77"
color6 = "#4bb5c1"
color14 = "#4bb5c1"
color7 = "#b2b2b5"
color15 = "#c2c2c5"

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    # format="%a %-d %b %X KW%V",)
    color=color4,
    format="%a %-d %b %X",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
# status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
# status.register("temp",
#     format="{temp:.0f}C",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# 14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# 14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
# status.register("battery",
#     format="{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
#     alert=True,
#     alert_percentage=10,
#     status={
#         "DIS": "",
#         "CHR": "",
#         "FULL": "=",
#     },)

# This would look like this:
# Discharging 6h:51m
status.register("battery",
    format="{status} {remaining:%E%hh:%Mm}",
    # alert=True,
    alert_percentage=5,
    charging_color=color1,
    full_color=color5,
    not_present_text="",
    status={
        "DIS":  "Discharging",
        "CHR":  "Charging",
        "FULL": "Bat full",
    },)

# Displays whether a DHCP client is running
# status.register("runwatch",
#     name="DHCP",
#     path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="eth0",
    format_up="{interface}",
    # format_up="{v4cidr}",
    color_up=color5,
    format_down="",)


# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    # hints = {"separator": False, "separator_block_width": 0},
    interface="wlan0",
    color_up=color5,
    color_down=color2,
    format_up="{essid} {quality:03.0f}%",
    format_down="no wifi",
    )

# Shows disk usage of /
# Format:
# 42/128G [86G]
# status.register("disk",
#     path="/",
#     format="{used}/{total}G [{avail}G]",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
# status.register("alsa",
    format="local {volume}%",
    color_muted=color1,
    color_unmuted=color5,
    )

# Shows mpd status
# Format:
# Cloud connectedReroute to Remain
# ^ looks like in flames?
mpdserver = "10.0.0.8"
status.register("mpd",
    format="{artist} : {title}",
    host=(mpdserver),
    # color_error="#720480",
    color=color5,
    max_field_len=0,
    hide_inactive=True,
    # msg_error="no mpd",
    status={
        "pause": "",
        "play": "",
        "stop": "",
    },)

status.register("shell",
        command="/home/spill/dotfiles/bin/mpdvol.sh",
        color=color4,
        interval=1,
        on_upscroll   = "mpc -h " + mpdserver + " volume +2",
        on_downscroll = "mpc -h " + mpdserver + " volume -2",
        on_rightclick = "mpc -h " + mpdserver + " pause",
        on_leftclick  = "mpc -h " + mpdserver + " play",
        )


status.run()
