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

status.register("clock",
    color=color4,
    format="%a %-d %b %X",)

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
    color_down=color7,
    format_up="{essid} {quality:03.0f}%",
    format_down="no wifi",
    )

# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
# status.register("alsa",
    format="local {volume}%",
    color_muted=color1,
    color_unmuted=color5,
    )

mpdserver = "10.0.0.8"
status.register("mpd",
    format="{artist} : {title}",
    host=(mpdserver),
    color=color5,
    max_field_len=0,
    hide_inactive=True,
    # msg_error="no mpd",
    status={
        "pause": "",
        "play": "",
        "stop": "",
    },
)

status.register("shell",
        command="/home/spill/dotfiles/bin/mpdvol.sh",
        color=color4,
        error_color=color7,
        interval=1,
        on_upscroll   = "mpc -h " + mpdserver + " volume +2",
        on_downscroll = "mpc -h " + mpdserver + " volume -2",
        on_rightclick = "mpc -h " + mpdserver + " pause",
        on_leftclick  = "mpc -h " + mpdserver + " play",
        )

status.run()
