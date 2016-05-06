# vim:syntax=apparmor
# Author: Oliver Leitner <never@neverslair-blog.net>

#include <tunables/global>

/home/nevermind/jd2/jre/bin/java {
  #include <abstractions/base>

  capability net_raw,

  network inet dgram,
  network inet raw,
  network inet stream,
  network inet6 stream,

  # Allow connecting to the wsocket
  unix (send, receive, connect)
	type=stream
	peer=(addr="@/tmp/.X11-unix/X0"),

  @{PROC}/[0-9]*/net/if_inet6 r,
  @{PROC}/[0-9]*/net/ipv6_route r,
  @{PROC}/[0-9]*/net/dev r,
  owner @{PROC}/[0-9]*/coredump_filter rw,

  #updates need this
  @{PROC}/[0-9]*/fd/ r,
  owner @{HOME}/jd2/JDownloader2 ixr,
  @{HOME}/.mozilla/firefox/ r,
  @{HOME}/.mozilla/firefox/** r,
  /usr/bin/basename ix,
  /usr/bin/dirname ix,
  @{HOME}/.install4j r,
  /usr/bin/expr ix,

  owner @{HOME}/jd2/jre/bin/java ixr,
  owner @{HOME}/jd2/cfg/ rw,
  owner @{HOME}/jd2/cfg/** rw,
  owner @{HOME}/.Xauthority r,
  /usr/share/fonts/ r,
  /usr/share/fonts/** r,
  /usr/share/icons/ r,
  /usr/share/icons/** r,
  @{HOME}/jd2/ mrwl,
  @{HOME}/jd2/** mrwl,
  /Backup/oneclick/ rw,
  /Backup/oneclick/** rw,
  /etc/nsswitch.conf r,
  /etc/passwd r,
  /etc/timezone r,
  /etc/lsb-release r,
  owner /tmp/ rw,
  owner /tmp/** rw,
  /sys/devices/system/cpu/ r,
  /sys/devices/system/cpu/** r,
  /var/cache/fontconfig/ rw,
  /var/cache/fontconfig/** rw,
  /etc/hosts r,
  /run/resolvconf/resolv.conf r,
  /etc/host.conf r,
  owner @{HOME}/.java/fonts/ rw,
  owner @{HOME}/.java/fonts/** rw,
  /etc/fonts/fonts.conf r,
  /etc/fonts/conf.d/ r,
  /usr/local/share/fonts/ r,
  /usr/local/share/fonts/** r,
  /usr/share/poppler/cMap/ r,
  /usr/share/poppler/cMap/** r,
  /etc/fonts/conf.avail/*.conf r,
  /etc/gnome-vfs-2.0/modules/ r,
  /etc/gnome-vfs-2.0/modules/*.conf r,
  /usr/bin/cut ix,
}
