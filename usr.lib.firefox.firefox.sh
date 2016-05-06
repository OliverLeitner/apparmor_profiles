# Last Modified: Thu May  5 11:26:53 2016
#include <tunables/global>

/usr/lib/firefox/firefox.sh {
  #include <abstractions/base>
  #include <abstractions/bash>

  capability net_raw,
  capability sys_ptrace,

  network inet dgram,
  network inet6 dgram,
  network inet raw,
  network inet6 raw,
  network inet stream,
  network inet6 stream,
  network netlink,

  /bin/dash ix,
  /usr/lib/firefox/firefox.sh ixr,
  /usr/lib/firefox/firefox ixr,
  /bin/which ixr,
  /usr/share/nvidia/nvidia-application-profiles-* r,
  /run/resolvconf/resolv.conf r,
  /etc/nsswitch.conf r,
  /etc/host.conf r,
  /etc/firefox/ r,
  /etc/firefox/** r,
  /etc/hosts r,
  /etc/gtk-3.0/settings.ini r,
  /etc/fonts/fonts.conf r,
  /usr/share/fonts/ r,
  /usr/share/fonts/** r,
  /var/cache/fontconfig/ mrw,
  /var/cache/fontconfig/** mrw,
  /etc/fonts/ r,
  /etc/fonts/** r,
  /usr/local/share/fonts/ r,
  /usr/local/share/fonts/** r,
  /usr/share/poppler/cMap/ r,
  /usr/share/poppler/cMap/** r,
  /etc/mime.types r,
  /usr/local/share/applications/ r,
  /usr/local/share/applications/** r,
  /usr/share/applications/ r,
  /usr/share/applications/** r,
  /etc/gnome/defaults.list r,
  /usr/share/icons/ r,
  /usr/share/icons/** r,
  /usr/share/mime/ r,
  /usr/share/mime/** r,
  /etc/passwd r,
  /usr/share/mozilla/ r,
  /usr/share/mozilla/** r,
  /var/lib/dbus/machine-id r,
  /usr/share/sounds/freedesktop/index.theme r,
  /etc/gai.conf r,
  /usr/share/hunspell/ r,
  /usr/share/hunspell/** r,
  /usr/share/pixmaps/ r,
  /usr/share/pixmaps/** r,
  /usr/lib/firefox/plugin-container ix,
  /bin/ps ix,
  /bin/grep ix,
  /etc/ssl/openssl.cnf r,
  /etc/adobe/mms.cfg r,
  /etc/mailcap r,

  #for youtube
  /run/dbus/system_bus_socket rw,
  /etc/pulse/client.conf r,
  /run/user/[0-9]*/pulse/ rwl,
  /usr/bin/pulseaudio ix,
  /usr/share/alsa/alsa.conf r,
  /run/user/[0-9]*/pulse/native rw,
  /etc/pulse/daemon.conf r,
  /usr/share/alsa/alsa.conf.d/ r,
  /usr/share/alsa/alsa.conf.d/** r,
  /usr/share/alsa/cards/aliases.conf r,
  /etc/machine-id r,

  #downloads need this
  /etc/fstab r,
  /usr/share/glib-2.0/schemas/gschemas.compiled r,
  /run/user/[0-9]*/dconf/user mrw,

  /var/tmp/ mrw,
  /var/tmp/** mrw,
  /tmp/ mrw,
  /tmp/** mrw,

  owner @{HOME}/.Xauthority r,
  owner @{HOME}/.mozilla/firefox/ mrw,
  owner @{HOME}/.mozilla/firefox/** mrw,
  owner @{HOME}/.cache/mozilla/firefox/ mrw,
  owner @{HOME}/.cache/mozilla/firefox/** mrw,
  owner @{HOME}/.cache/event-sound-cache.* mrw,
  owner @{HOME}/.config/mimeapps.list mrw,
  owner @{HOME}/.local/share/applications/ mrw,
  owner @{HOME}/.local/share/applications/** mrw,
  owner @{HOME}.nv/ mrw,
  owner @{HOME}.nv/** mrw,
  owner @{HOME}/.local/share/mime/ mrw,
  owner @{HOME}/.local/share/mime/** mrw,
  owner @{HOME}/.config/user-dirs.dirs mrw,
  owner @{HOME}/.local/share/icons/ mrw,
  owner @{HOME}/.local/share/icons/** mrw,
  owner @{HOME}/.adobe/Flash_Player/AssetCache/ mrw,
  owner @{HOME}/.adobe/Flash_Player/AssetCache/** mrw,
  owner @{HOME}/.macromedia/Flash_Player/#SharedObjects/ mrw,
  owner @{HOME}/.macromedia/Flash_Player/#SharedObjects/** mrw,
  owner @{HOME}/.macromedia/Flash_Player/macromedia.com/support/flashplayer/sys/settings.* mrw,

  #if you want to download something...
  @{HOME}/.local/share/recently-used.xbel mrw,
  owner @{HOME}/.config/dconf/user mrw,
  @{HOME}/.local/share/recently-used.xbel.* mrw,

  #for youtube
  owner @{HOME}/.config/pulse/ rw,
  owner @{HOME}/.config/pulse/** rw,

  /proc/[0-9]*/stat r,
  /proc/[0-9]*/status r,
  /proc/[0-9]*/task/ r,
  /proc/[0-9]*/task/[0-9]*/stat r,
  /proc/modules r,
  /proc/driver/nvidia/params r,
  /proc/[0-9]*/mountinfo r,
  /proc/[0-9]*/fd/ r,
  /proc/[0-9]*/cmdline r,
  /proc/uptime r,
  /proc/sys/kernel/pid_max r,
  /proc/tty/drivers r,
  /proc/ r,

  /sys/devices/system/cpu/present r,
  /sys/devices/system/cpu/cpufreq/policy[0-9]/cpuinfo_max_freq r,
  /sys/devices/system/cpu/cpu[0-9]/cache/index[0-9]/size r,
  /sys/devices/system/cpu/ r,
  /sys/devices/system/node/ r,
  /sys/devices/system/node/node[0-9]/meminfo r,

  /dev/nvidiactl mrwix,
  /dev/nvidia-modeset mrwix,
  /dev/nvidia[0-9] mrwix,

  #for youtube
  /dev/shm/ mrwix,
  /dev/shm/** mrwix,

  # Allow connecting to the wsocket
  unix (send, receive, connect)
	type=stream
	peer=(addr="@/tmp/.X11-unix/X0"),
  unix (send, receive, connect)
	type=stream
	peer=(addr="@/tmp/dbus-*"),
  unix (send, receive, connect)
	type=dgram
	peer=(addr=none),

  dbus (send)
	  bus=system
	  peer=(name=org.freedesktop.DBus),
  dbus (send)
	  bus=system
	  interface=org.freedesktop.DBus.Properties,
  dbus (send)
	  bus=session
	  peer=(name=org.freedesktop.DBus),
  dbus (send)
	  bus=session
	  peer=(name=org.gnome.GConf),
  dbus (send)
	  bus=session
	  peer=(name=org.a11y.Bus),
  dbus (send)
	  bus=session
	  interface=org.gnome.GConf.Server,
  dbus (receive, send)
	  bus=session
	  interface=ca.desrt.dconf.Writer,
  dbus (receive)
	  bus=session
	  interface=org.freedesktop.DBus**,
  dbus (receive, send)
	  bus=accessibility,

  ptrace,
  signal,

  #special: change these to fit your needs...
  owner @{HOME}/Desktop/ mrw,
  owner @{HOME}/Desktop/** mrw,
  owner @{HOME}/Bilder/ mrw,
  owner @{HOME}/Bilder/** mrw,
  owner @{HOME}/Downloads/ mrw,
  owner @{HOME}/Downloads/** mrw,
  owner @{HOME}/Dokumente/ mrw,
  owner @{HOME}/Dokumente/** mrw,
  /Backup/oneclick/ rw,
  /Backup/oneclick/** rw,
  /Backup/pp/ rw,
  /Backup/pp/** rw,
}
