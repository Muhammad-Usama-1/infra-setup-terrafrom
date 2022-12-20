# Process Management in Linux

what is process ?

process is comipiled source that is currently running on a system
every process has a unique id

process has sub-process (child ) chilld also have process id

what is init ?

a process having id 1

init has been replaced with systemd in latest system

1st process which run on machine in init(systemd)

init process in start by kernal technacilly it does not have prents process

you can kill the runnig process (die)

there are a lot of process which run all time from start in machine is called deamon process (daemon process never die and you shoulnt kill )

zombie process is a process which is killed but shown as a process

$ is a special variable which store shell process id

it will show the details of a service

```bash
ps -C anyservie
```

differnetwat to see process

```bash
ps -ef
ps -fx
pgrep bash
#in from of tree
pstree
```

output of pstree

```yaml
systemd─┬─ModemManager───2*[{ModemManager}]
├─NetworkManager───2*[{NetworkManager}]
├─accounts-daemon───2*[{accounts-daemon}]
├─acpid
├─avahi-daemon───avahi-daemon
├─bluetoothd
├─colord───2*[{colord}]
├─containerd───10*[{containerd}]
├─cron
├─cups-browsed───2*[{cups-browsed}]
├─cupsd
├─dbus-daemon
├─dockerd───9*[{dockerd}]
├─fwupd───4*[{fwupd}]
├─gdm3─┬─gdm-session-wor─┬─gdm-wayland-ses─┬─gnome-session-b───2*[{gnome-session-b}]
│      │                 │                 └─2*[{gdm-wayland-ses}]
│      │                 └─2*[{gdm-session-wor}]
│      └─2*[{gdm3}]
├─gnome-keyring-d───3*[{gnome-keyring-d}]
├─irqbalance───{irqbalance}
├─2*[kerneloops]
├─mongod───32*[{mongod}]
├─networkd-dispat
├─packagekitd───2*[{packagekitd}]
├─polkitd───2*[{polkitd}]
├─power-profiles-───2*[{power-profiles-}]
├─rsyslogd───3*[{rsyslogd}]
├─rtkit-daemon───2*[{rtkit-daemon}]
├─snapd───15*[{snapd}]
├─switcheroo-cont───2*[{switcheroo-cont}]
├─systemd─┬─(sd-pam)
│         ├─at-spi2-registr───2*[{at-spi2-registr}]
│         ├─2*[chrome_crashpad───2*[{chrome_crashpad}]]
│         ├─chrome_crashpad───{chrome_crashpad}
│         ├─code─┬─code───code───9*[{code}]
│         │      ├─code───code───11*[{code}]
│         │      ├─code───5*[{code}]
│         │      ├─code───15*[{code}]
│         │      ├─code─┬─code───7*[{code}]
│         │      │      └─12*[{code}]
│         │      ├─code─┬─code─┬─bash
│         │      │      │      └─12*[{code}]
│         │      │      ├─code───13*[{code}]
│         │      │      └─16*[{code}]
│         │      └─29*[{code}]
│         ├─dbus-daemon
│         ├─dconf-service───2*[{dconf-service}]
│         ├─evolution-addre───5*[{evolution-addre}]
│         ├─evolution-calen───8*[{evolution-calen}]
│         ├─evolution-sourc───3*[{evolution-sourc}]
│         ├─2*[gjs───6*[{gjs}]]
│         ├─gnome-calendar───5*[{gnome-calendar}]
│         ├─gnome-session-b─┬─at-spi-bus-laun─┬─dbus-daemon
│         │                 │                 └─3*[{at-spi-bus-laun}]
│         │                 ├─evolution-alarm───5*[{evolution-alarm}]
│         │                 ├─gsd-disk-utilit───2*[{gsd-disk-utilit}]
│         │                 ├─update-notifier───3*[{update-notifier}]
│         │                 └─4*[{gnome-session-b}]
│         ├─gnome-session-c───{gnome-session-c}
│         ├─gnome-shell─┬─Xwayland───2*[{Xwayland}]
│         │             ├─chrome─┬─2*[cat]
│         │             │        ├─chrome───chrome───12*[{chrome}]
│         │             │        ├─chrome─┬─chrome─┬─chrome───5*[{chrome}]
│         │             │        │        │        ├─6*[chrome───10*[{chrome}]]
│         │             │        │        │        ├─chrome───12*[{chrome}]
│         │             │        │        │        ├─chrome───13*[{chrome}]
│         │             │        │        │        ├─chrome───11*[{chrome}]
│         │             │        │        │        ├─chrome───16*[{chrome}]
│         │             │        │        │        ├─chrome───4*[{chrome}]
│         │             │        │        │        └─chrome───6*[{chrome}]
│         │             │        │        └─nacl_helper
│         │             │        ├─chrome───7*[{chrome}]
│         │             │        ├─chrome───8*[{chrome}]
│         │             │        └─24*[{chrome}]
│         │             ├─gjs───7*[{gjs}]
│         │             └─14*[{gnome-shell}]
│         ├─gnome-shell-cal───5*[{gnome-shell-cal}]
│         ├─gnome-terminal───gnome-terminal.───3*[{gnome-terminal.}]
│         ├─gnome-terminal-─┬─bash───pstree
│         │                 └─3*[{gnome-terminal-}]
│         ├─goa-daemon───3*[{goa-daemon}]
│         ├─goa-identity-se───2*[{goa-identity-se}]
│         ├─gsd-a11y-settin───3*[{gsd-a11y-settin}]
│         ├─gsd-color───4*[{gsd-color}]
│         ├─gsd-datetime───3*[{gsd-datetime}]
│         ├─gsd-housekeepin───3*[{gsd-housekeepin}]
│         ├─gsd-keyboard───3*[{gsd-keyboard}]
│         ├─gsd-media-keys───3*[{gsd-media-keys}]
│         ├─gsd-power───4*[{gsd-power}]
│         ├─gsd-print-notif───2*[{gsd-print-notif}]
│         ├─gsd-printer───2*[{gsd-printer}]
│         ├─gsd-rfkill───2*[{gsd-rfkill}]
│         ├─gsd-screensaver───2*[{gsd-screensaver}]
│         ├─gsd-sharing───3*[{gsd-sharing}]
│         ├─gsd-smartcard───3*[{gsd-smartcard}]
│         ├─gsd-sound───3*[{gsd-sound}]
│         ├─gsd-wacom───3*[{gsd-wacom}]
│         ├─gsd-xsettings───4*[{gsd-xsettings}]
│         ├─gvfs-afc-volume───3*[{gvfs-afc-volume}]
│         ├─gvfs-goa-volume───2*[{gvfs-goa-volume}]
│         ├─gvfs-gphoto2-vo───2*[{gvfs-gphoto2-vo}]
│         ├─gvfs-mtp-volume───2*[{gvfs-mtp-volume}]
│         ├─gvfs-udisks2-vo───3*[{gvfs-udisks2-vo}]
│         ├─gvfsd─┬─gvfsd-dnssd───2*[{gvfsd-dnssd}]
│         │       ├─gvfsd-network───3*[{gvfsd-network}]
│         │       ├─gvfsd-trash───2*[{gvfsd-trash}]
│         │       └─2*[{gvfsd}]
│         ├─gvfsd-fuse───5*[{gvfsd-fuse}]
│         ├─gvfsd-metadata───2*[{gvfsd-metadata}]
│         ├─ibus-portal───2*[{ibus-portal}]
│         ├─ibus-x11───2*[{ibus-x11}]
│         ├─pipewire───{pipewire}
│         ├─pipewire-media-───{pipewire-media-}
│         ├─pulseaudio───3*[{pulseaudio}]
│         ├─seahorse───3*[{seahorse}]
│         ├─sh───ibus-daemon─┬─ibus-engine-sim───2*[{ibus-engine-sim}]
│         │                  ├─ibus-extension-───3*[{ibus-extension-}]
│         │                  ├─ibus-memconf───2*[{ibus-memconf}]
│         │                  └─2*[{ibus-daemon}]
│         ├─snap-store───4*[{snap-store}]
│         ├─snapd-desktop-i───snapd-desktop-i───3*[{snapd-desktop-i}]
│         ├─tracker-miner-f───5*[{tracker-miner-f}]
│         ├─xdg-desktop-por───6*[{xdg-desktop-por}]
│         ├─xdg-desktop-por───5*[{xdg-desktop-por}]
│         ├─xdg-desktop-por───3*[{xdg-desktop-por}]
│         ├─xdg-document-po─┬─fusermount3
│         │                 └─6*[{xdg-document-po}]
│         └─xdg-permission-───2*[{xdg-permission-}]
├─systemd-journal
├─systemd-logind
├─systemd-oomd
├─systemd-resolve
├─systemd-timesyn───{systemd-timesyn}
├─systemd-udevd
├─thermald───{thermald}
├─udisksd───4*[{udisksd}]
├─unattended-upgr───{unattended-upgr}
├─upowerd───2*[{upowerd}]
└─wpa_supplicant
```

and you can use pstree in differnet way

```bash
pstree -p -u usama
#-p mean processid , -u user usama intiate process
```

```yaml
gdm-wayland-ses(2251)─┬─gnome-session-b(2254)─┬─{gnome-session-b}(2286)
│                       └─{gnome-session-b}(2287)
├─{gdm-wayland-ses}(2252)
└─{gdm-wayland-ses}(2253)

gnome-keyring-d(2187)─┬─{gnome-keyring-d}(2188)
├─{gnome-keyring-d}(2189)
└─{gnome-keyring-d}(2297)

systemd(2158)─┬─(sd-pam)(2159)
├─at-spi2-registr(2488)─┬─{at-spi2-registr}(2492)
│                       └─{at-spi2-registr}(2493)
├─chrome_crashpad(4441)─┬─{chrome_crashpad}(4445)
│                       └─{chrome_crashpad}(4446)
├─chrome_crashpad(4443)───{chrome_crashpad}(4444)
├─chrome_crashpad(26626)─┬─{chrome_crashpad}(26627)
│                        └─{chrome_crashpad}(26628)
├─code(26611)─┬─code(26613)───code(26660)─┬─{code}(26664)
│             │                           ├─{code}(26665)
│             │                           ├─{code}(26666)
│             │                           ├─{code}(26667)
│             │                           ├─{code}(26668)
│             │                           ├─{code}(26669)
│             │                           ├─{code}(26670)
│             │                           ├─{code}(26671)
│             │                           └─{code}(26673)
│             ├─code(26614)───code(26752)─┬─{code}(26753)
│             │                           ├─{code}(26755)
│             │                           ├─{code}(26757)
│             │                           ├─{code}(26762)
│             │                           ├─{code}(26763)
│             │                           ├─{code}(26764)
│             │                           ├─{code}(26765)
│             │                           ├─{code}(26766)
│             │                           ├─{code}(26770)
│             │                           ├─{code}(28443)
│             │                           ├─{code}(28499)
│             │                           └─{code}(28508)
│             ├─code(26653)─┬─{code}(26654)
│             │             ├─{code}(26656)
│             │             ├─{code}(26658)
│             │             ├─{code}(26659)
│             │             └─{code}(28538)
│             ├─code(26677)─┬─{code}(26679)
│             │             ├─{code}(26681)
│             │             ├─{code}(26684)
│             │             ├─{code}(26686)
│             │             ├─{code}(26687)
│             │             ├─{code}(26688)
│             │             ├─{code}(26689)
│             │             ├─{code}(26690)
│             │             ├─{code}(26691)
│             │             ├─{code}(26703)
│             │             ├─{code}(26736)
│             │             ├─{code}(26769)
│             │             ├─{code}(28302)
│             │             ├─{code}(28488)
│             │             └─{code}(28496)
│             ├─code(26695)─┬─code(26711)─┬─{code}(26715)
│             │             │             ├─{code}(26716)
│             │             │             ├─{code}(26717)
│             │             │             ├─{code}(26718)
│             │             │             ├─{code}(26719)
│             │             │             ├─{code}(26720)
│             │             │             └─{code}(26726)
│             │             ├─{code}(26696)
│             │             ├─{code}(26697)
│             │             ├─{code}(26698)
│             │             ├─{code}(26699)
│             │             ├─{code}(26700)
│             │             ├─{code}(26701)
│             │             ├─{code}(26702)
│             │             ├─{code}(26704)
│             │             ├─{code}(26705)
│             │             ├─{code}(26706)
│             │             ├─{code}(26707)
│             │             └─{code}(26708)
│             ├─code(26710)─┬─code(26735)─┬─bash(26823)
│             │             │             ├─{code}(26742)
│             │             │             ├─{code}(26743)
│             │             │             ├─{code}(26744)
│             │             │             ├─{code}(26745)
│             │             │             ├─{code}(26746)
│             │             │             ├─{code}(26747)
│             │             │             ├─{code}(26749)
│             │             │             ├─{code}(26771)
│             │             │             ├─{code}(26772)
│             │             │             ├─{code}(26773)
│             │             │             ├─{code}(26774)
│             │             │             └─{code}(26824)
│             │             ├─code(26781)─┬─{code}(26789)
│             │             │             ├─{code}(26790)
│             │             │             ├─{code}(26791)
│             │             │             ├─{code}(26792)
│             │             │             ├─{code}(26793)
│             │             │             ├─{code}(26794)
│             │             │             ├─{code}(26796)
│             │             │             ├─{code}(26806)
│             │             │             ├─{code}(26807)
│             │             │             ├─{code}(26808)
│             │             │             ├─{code}(26809)
│             │             │             ├─{code}(26810)
│             │             │             └─{code}(26811)
│             │             ├─{code}(26721)
│             │             ├─{code}(26723)
│             │             ├─{code}(26725)
│             │             ├─{code}(26727)
│             │             ├─{code}(26728)
│             │             ├─{code}(26729)
│             │             ├─{code}(26730)
│             │             ├─{code}(26731)
│             │             ├─{code}(26732)
│             │             ├─{code}(26737)
│             │             ├─{code}(26738)
│             │             ├─{code}(26739)
│             │             ├─{code}(26740)
│             │             ├─{code}(26775)
│             │             ├─{code}(26776)
│             │             └─{code}(28361)
│             ├─{code}(26612)
│             ├─{code}(26615)
│             ├─{code}(26618)
│             ├─{code}(26619)
│             ├─{code}(26620)
│             ├─{code}(26621)
│             ├─{code}(26622)
│             ├─{code}(26623)
│             ├─{code}(26624)
│             ├─{code}(26629)
│             ├─{code}(26630)
│             ├─{code}(26631)
│             ├─{code}(26632)
│             ├─{code}(26633)
│             ├─{code}(26634)
│             ├─{code}(26636)
│             ├─{code}(26638)
│             ├─{code}(26640)
│             ├─{code}(26641)
│             ├─{code}(26642)
│             ├─{code}(26644)
│             ├─{code}(26645)
│             ├─{code}(26646)
│             ├─{code}(26647)
│             ├─{code}(26662)
│             ├─{code}(26676)
│             ├─{code}(26685)
│             ├─{code}(27134)
│             └─{code}(28539)
├─dbus-daemon(2184)
├─dconf-service(2450)─┬─{dconf-service}(2451)
│                     └─{dconf-service}(2452)
├─evolution-addre(2461)─┬─{evolution-addre}(2465)
│                       ├─{evolution-addre}(2466)
│                       ├─{evolution-addre}(2468)
│                       ├─{evolution-addre}(2469)
│                       └─{evolution-addre}(2471)
├─evolution-calen(2446)─┬─{evolution-calen}(2447)
│                       ├─{evolution-calen}(2448)
│                       ├─{evolution-calen}(2453)
│                       ├─{evolution-calen}(2454)
│                       ├─{evolution-calen}(2455)
│                       ├─{evolution-calen}(2457)
│                       ├─{evolution-calen}(2459)
│                       └─{evolution-calen}(2460)
├─evolution-sourc(2438)─┬─{evolution-sourc}(2439)
│                       ├─{evolution-sourc}(2440)
│                       └─{evolution-sourc}(2441)
├─gjs(2486)─┬─{gjs}(2490)
│           ├─{gjs}(2491)
│           ├─{gjs}(2494)
│           ├─{gjs}(2495)
│           ├─{gjs}(2496)
│           └─{gjs}(2497)
├─gjs(2874)─┬─{gjs}(2885)
│           ├─{gjs}(2887)
│           ├─{gjs}(2888)
│           ├─{gjs}(2889)
│           ├─{gjs}(2890)
│           └─{gjs}(2891)
├─gnome-calendar(6255)─┬─{gnome-calendar}(6283)
│                      ├─{gnome-calendar}(6285)
│                      ├─{gnome-calendar}(6286)
│                      ├─{gnome-calendar}(6310)
│                      └─{gnome-calendar}(6320)
├─gnome-session-b(2303)─┬─at-spi-bus-laun(2336)─┬─dbus-daemon(2349)
│                       │                       ├─{at-spi-bus-laun}(2343)
│                       │                       ├─{at-spi-bus-laun}(2344)
│                       │                       └─{at-spi-bus-laun}(2347)
│                       ├─evolution-alarm(2583)─┬─{evolution-alarm}(2658)
│                       │                       ├─{evolution-alarm}(2660)
│                       │                       ├─{evolution-alarm}(2662)
│                       │                       ├─{evolution-alarm}(2867)
│                       │                       └─{evolution-alarm}(2871)
│                       ├─gsd-disk-utilit(2613)─┬─{gsd-disk-utilit}(2616)
│                       │                       └─{gsd-disk-utilit}(2627)
│                       ├─update-notifier(4284)─┬─{update-notifier}(4289)
│                       │                       ├─{update-notifier}(4291)
│                       │                       └─{update-notifier}(4292)
│                       ├─{gnome-session-b}(2306)
│                       ├─{gnome-session-b}(2307)
│                       └─{gnome-session-b}(2311)
├─gnome-session-c(2290)───{gnome-session-c}(2296)
├─gnome-shell(2340)─┬─Xwayland(4464)─┬─{Xwayland}(4466)
│                   │                └─{Xwayland}(4467)
│                   ├─chrome(4433)─┬─cat(4438)
│                   │              ├─cat(4439)
│                   │              ├─chrome(4449)───chrome(4516)─┬─{chrome}(4538)
│                   │              │                             ├─{chrome}(4539)
│                   │              │                             ├─{chrome}(4548)
│                   │              │                             ├─{chrome}(4549)
│                   │              │                             ├─{chrome}(4551)
│                   │              │                             ├─{chrome}(4553)
│                   │              │                             ├─{chrome}(4554)
│                   │              │                             ├─{chrome}(4911)
│                   │              │                             ├─{chrome}(7858)
│                   │              │                             ├─{chrome}(8632)
│                   │              │                             ├─{chrome}(18767)
│                   │              │                             └─{chrome}(27776)
│                   │              ├─chrome(4450)─┬─chrome(4454)─┬─chrome(4527)─┬─{chrome}(4528)
│                   │              │              │              │              ├─{chrome}(4531)
│                   │              │              │              │              ├─{chrome}(8635)
│                   │              │              │              │              ├─{chrome}(27954)
│                   │              │              │              │              └─{chrome}(28588)
│                   │              │              │              ├─chrome(4622)─┬─{chrome}(4624)
│                   │              │              │              │              ├─{chrome}(4626)
│                   │              │              │              │              ├─{chrome}(4628)
│                   │              │              │              │              ├─{chrome}(4630)
│                   │              │              │              │              ├─{chrome}(4631)
│                   │              │              │              │              ├─{chrome}(4643)
│                   │              │              │              │              ├─{chrome}(4644)
│                   │              │              │              │              ├─{chrome}(4645)
│                   │              │              │              │              ├─{chrome}(8636)
│                   │              │              │              │              └─{chrome}(28504)
│                   │              │              │              ├─chrome(4633)─┬─{chrome}(4634)
│                   │              │              │              │              ├─{chrome}(4636)
│                   │              │              │              │              ├─{chrome}(4638)
│                   │              │              │              │              ├─{chrome}(4646)
│                   │              │              │              │              ├─{chrome}(4647)
│                   │              │              │              │              ├─{chrome}(4657)
│                   │              │              │              │              ├─{chrome}(4658)
│                   │              │              │              │              ├─{chrome}(4659)
│                   │              │              │              │              ├─{chrome}(4708)
│                   │              │              │              │              ├─{chrome}(4720)
│                   │              │              │              │              ├─{chrome}(8626)
│                   │              │              │              │              └─{chrome}(28292)
│                   │              │              │              ├─chrome(4648)─┬─{chrome}(4649)
│                   │              │              │              │              ├─{chrome}(4651)
│                   │              │              │              │              ├─{chrome}(4653)
│                   │              │              │              │              ├─{chrome}(4655)
│                   │              │              │              │              ├─{chrome}(4656)
│                   │              │              │              │              ├─{chrome}(4679)
│                   │              │              │              │              ├─{chrome}(4680)
│                   │              │              │              │              ├─{chrome}(4681)
│                   │              │              │              │              ├─{chrome}(4747)
│                   │              │              │              │              ├─{chrome}(4748)
│                   │              │              │              │              ├─{chrome}(4760)
│                   │              │              │              │              ├─{chrome}(8625)
│                   │              │              │              │              └─{chrome}(28503)
│                   │              │              │              ├─chrome(4661)─┬─{chrome}(4668)
│                   │              │              │              │              ├─{chrome}(4670)
│                   │              │              │              │              ├─{chrome}(4672)
│                   │              │              │              │              ├─{chrome}(4676)
│                   │              │              │              │              ├─{chrome}(4677)
│                   │              │              │              │              ├─{chrome}(4691)
│                   │              │              │              │              ├─{chrome}(4692)
│                   │              │              │              │              ├─{chrome}(4693)
│                   │              │              │              │              ├─{chrome}(8627)
│                   │              │              │              │              └─{chrome}(28285)
│                   │              │              │              ├─chrome(4682)─┬─{chrome}(4683)
│                   │              │              │              │              ├─{chrome}(4685)
│                   │              │              │              │              ├─{chrome}(4687)
│                   │              │              │              │              ├─{chrome}(4689)
│                   │              │              │              │              ├─{chrome}(4690)
│                   │              │              │              │              ├─{chrome}(4694)
│                   │              │              │              │              ├─{chrome}(4695)
│                   │              │              │              │              ├─{chrome}(4696)
│                   │              │              │              │              ├─{chrome}(8634)
│                   │              │              │              │              └─{chrome}(24855)
│                   │              │              │              ├─chrome(8126)─┬─{chrome}(8130)
│                   │              │              │              │              ├─{chrome}(8132)
│                   │              │              │              │              ├─{chrome}(8134)
│                   │              │              │              │              ├─{chrome}(8136)
│                   │              │              │              │              ├─{chrome}(8137)
│                   │              │              │              │              ├─{chrome}(8157)
│                   │              │              │              │              ├─{chrome}(8158)
│                   │              │              │              │              ├─{chrome}(8159)
│                   │              │              │              │              ├─{chrome}(8232)
│                   │              │              │              │              ├─{chrome}(28293)
│                   │              │              │              │              ├─{chrome}(28536)
│                   │              │              │              │              ├─{chrome}(28537)
│                   │              │              │              │              └─{chrome}(28582)
│                   │              │              │              ├─chrome(10458)─┬─{chrome}(10462)
│                   │              │              │              │               ├─{chrome}(10464)
│                   │              │              │              │               ├─{chrome}(10467)
│                   │              │              │              │               ├─{chrome}(10469)
│                   │              │              │              │               ├─{chrome}(10470)
│                   │              │              │              │               ├─{chrome}(10529)
│                   │              │              │              │               ├─{chrome}(10530)
│                   │              │              │              │               ├─{chrome}(10531)
│                   │              │              │              │               ├─{chrome}(12556)
│                   │              │              │              │               └─{chrome}(27558)
│                   │              │              │              ├─chrome(26286)─┬─{chrome}(26290)
│                   │              │              │              │               ├─{chrome}(26292)
│                   │              │              │              │               ├─{chrome}(26294)
│                   │              │              │              │               ├─{chrome}(26296)
│                   │              │              │              │               ├─{chrome}(26297)
│                   │              │              │              │               ├─{chrome}(26309)
│                   │              │              │              │               ├─{chrome}(26310)
│                   │              │              │              │               ├─{chrome}(26311)
│                   │              │              │              │               ├─{chrome}(26322)
│                   │              │              │              │               ├─{chrome}(27098)
│                   │              │              │              │               ├─{chrome}(28283)
│                   │              │              │              │               └─{chrome}(28554)
│                   │              │              │              ├─chrome(26308)─┬─{chrome}(26312)
│                   │              │              │              │               ├─{chrome}(26314)
│                   │              │              │              │               ├─{chrome}(26316)
│                   │              │              │              │               ├─{chrome}(26318)
│                   │              │              │              │               ├─{chrome}(26319)
│                   │              │              │              │               ├─{chrome}(27015)
│                   │              │              │              │               ├─{chrome}(27016)
│                   │              │              │              │               ├─{chrome}(27017)
│                   │              │              │              │               ├─{chrome}(27026)
│                   │              │              │              │               ├─{chrome}(27027)
│                   │              │              │              │               ├─{chrome}(27144)
│                   │              │              │              │               ├─{chrome}(27650)
│                   │              │              │              │               ├─{chrome}(27777)
│                   │              │              │              │               ├─{chrome}(28396)
│                   │              │              │              │               ├─{chrome}(28540)
│                   │              │              │              │               └─{chrome}(28542)
│                   │              │              │              ├─chrome(27014)─┬─{chrome}(27018)
│                   │              │              │              │               ├─{chrome}(27020)
│                   │              │              │              │               ├─{chrome}(27022)
│                   │              │              │              │               ├─{chrome}(27023)
│                   │              │              │              │               ├─{chrome}(27024)
│                   │              │              │              │               ├─{chrome}(27040)
│                   │              │              │              │               ├─{chrome}(27041)
│                   │              │              │              │               ├─{chrome}(27042)
│                   │              │              │              │               ├─{chrome}(27335)
│                   │              │              │              │               └─{chrome}(28365)
│                   │              │              │              ├─chrome(28336)─┬─{chrome}(28339)
│                   │              │              │              │               ├─{chrome}(28341)
│                   │              │              │              │               ├─{chrome}(28342)
│                   │              │              │              │               ├─{chrome}(28344)
│                   │              │              │              │               ├─{chrome}(28346)
│                   │              │              │              │               ├─{chrome}(28347)
│                   │              │              │              │               ├─{chrome}(28575)
│                   │              │              │              │               ├─{chrome}(28576)
│                   │              │              │              │               ├─{chrome}(28577)
│                   │              │              │              │               ├─{chrome}(28589)
│                   │              │              │              │               └─{chrome}(28590)
│                   │              │              │              ├─chrome(28544)─┬─{chrome}(28545)
│                   │              │              │              │               ├─{chrome}(28546)
│                   │              │              │              │               ├─{chrome}(28547)
│                   │              │              │              │               ├─{chrome}(28548)
│                   │              │              │              │               ├─{chrome}(28549)
│                   │              │              │              │               ├─{chrome}(28550)
│                   │              │              │              │               ├─{chrome}(28551)
│                   │              │              │              │               ├─{chrome}(28552)
│                   │              │              │              │               └─{chrome}(28553)
│                   │              │              │              ├─chrome(28561)─┬─{chrome}(28562)
│                   │              │              │              │               ├─{chrome}(28563)
│                   │              │              │              │               ├─{chrome}(28564)
│                   │              │              │              │               ├─{chrome}(28565)
│                   │              │              │              │               ├─{chrome}(28566)
│                   │              │              │              │               ├─{chrome}(28567)
│                   │              │              │              │               ├─{chrome}(28569)
│                   │              │              │              │               ├─{chrome}(28570)
│                   │              │              │              │               ├─{chrome}(28571)
│                   │              │              │              │               ├─{chrome}(28572)
│                   │              │              │              │               └─{chrome}(28573)
│                   │              │              │              └─chrome(28574)─┬─{chrome}(28578)
│                   │              │              │                              ├─{chrome}(28579)
│                   │              │              │                              ├─{chrome}(28580)
│                   │              │              │                              ├─{chrome}(28581)
│                   │              │              │                              ├─{chrome}(28583)
│                   │              │              │                              ├─{chrome}(28584)
│                   │              │              │                              ├─{chrome}(28585)
│                   │              │              │                              └─{chrome}(28586)
│                   │              │              └─nacl_helper(4451)
│                   │              ├─chrome(4518)─┬─{chrome}(4520)
│                   │              │              ├─{chrome}(4521)
│                   │              │              ├─{chrome}(4524)
│                   │              │              ├─{chrome}(4526)
│                   │              │              ├─{chrome}(8633)
│                   │              │              ├─{chrome}(25574)
│                   │              │              └─{chrome}(27950)
│                   │              ├─chrome(4912)─┬─{chrome}(4913)
│                   │              │              ├─{chrome}(4914)
│                   │              │              ├─{chrome}(4915)
│                   │              │              ├─{chrome}(4916)
│                   │              │              ├─{chrome}(4919)
│                   │              │              ├─{chrome}(8637)
│                   │              │              └─{chrome}(28541)
│                   │              ├─{chrome}(4447)
│                   │              ├─{chrome}(4455)
│                   │              ├─{chrome}(4456)
│                   │              ├─{chrome}(4457)
│                   │              ├─{chrome}(4460)
│                   │              ├─{chrome}(4461)
│                   │              ├─{chrome}(4463)
│                   │              ├─{chrome}(4502)
│                   │              ├─{chrome}(4503)
│                   │              ├─{chrome}(4505)
│                   │              ├─{chrome}(4507)
│                   │              ├─{chrome}(4508)
│                   │              ├─{chrome}(4509)
│                   │              ├─{chrome}(4512)
│                   │              ├─{chrome}(4513)
│                   │              ├─{chrome}(4514)
│                   │              ├─{chrome}(4515)
│                   │              ├─{chrome}(4533)
│                   │              ├─{chrome}(4632)
│                   │              ├─{chrome}(23364)
│                   │              ├─{chrome}(27906)
│                   │              ├─{chrome}(27910)
│                   │              ├─{chrome}(28424)
│                   │              ├─{chrome}(28568)
│                   │              └─{chrome}(28587)
│                   ├─gjs(26069)─┬─{gjs}(26071)
│                   │            ├─{gjs}(26072)
│                   │            ├─{gjs}(26073)
│                   │            ├─{gjs}(26074)
│                   │            ├─{gjs}(26075)
│                   │            ├─{gjs}(26076)
│                   │            └─{gjs}(26086)
│                   ├─{gnome-shell}(2356)
│                   ├─{gnome-shell}(2368)
│                   ├─{gnome-shell}(2391)
│                   ├─{gnome-shell}(2396)
│                   ├─{gnome-shell}(2398)
│                   ├─{gnome-shell}(2400)
│                   ├─{gnome-shell}(2401)
│                   ├─{gnome-shell}(2423)
│                   ├─{gnome-shell}(2424)
│                   ├─{gnome-shell}(2425)
│                   ├─{gnome-shell}(2426)
│                   ├─{gnome-shell}(4504)
│                   ├─{gnome-shell}(13420)
│                   └─{gnome-shell}(28560)
├─gnome-shell-cal(2432)─┬─{gnome-shell-cal}(2433)
│                       ├─{gnome-shell-cal}(2435)
│                       ├─{gnome-shell-cal}(2436)
│                       ├─{gnome-shell-cal}(2437)
│                       └─{gnome-shell-cal}(2445)
├─gnome-terminal(28055)───gnome-terminal.(28058)─┬─{gnome-terminal.}(28059)
│                                                ├─{gnome-terminal.}(28061)
│                                                └─{gnome-terminal.}(28062)
├─gnome-terminal-(28063)─┬─bash(28081)───pstree(28591)
│                        ├─{gnome-terminal-}(28064)
│                        ├─{gnome-terminal-}(28066)
│                        └─{gnome-terminal-}(28067)
├─goa-daemon(2372)─┬─{goa-daemon}(2377)
│                  ├─{goa-daemon}(2379)
│                  └─{goa-daemon}(2380)
├─goa-identity-se(2383)─┬─{goa-identity-se}(2385)
│                       └─{goa-identity-se}(2387)
├─gsd-a11y-settin(2500)─┬─{gsd-a11y-settin}(2514)
│                       ├─{gsd-a11y-settin}(2520)
│                       └─{gsd-a11y-settin}(2529)
├─gsd-color(2501)─┬─{gsd-color}(2565)
│                 ├─{gsd-color}(2570)
│                 └─{gsd-color}(2577)
├─gsd-datetime(2503)─┬─{gsd-datetime}(2535)
│                    ├─{gsd-datetime}(2550)
│                    └─{gsd-datetime}(2573)
├─gsd-housekeepin(2504)─┬─{gsd-housekeepin}(2515)
│                       ├─{gsd-housekeepin}(2525)
│                       └─{gsd-housekeepin}(2534)
├─gsd-keyboard(2505)─┬─{gsd-keyboard}(2539)
│                    ├─{gsd-keyboard}(2543)
│                    └─{gsd-keyboard}(2553)
├─gsd-media-keys(2506)─┬─{gsd-media-keys}(2580)
│                      ├─{gsd-media-keys}(2582)
│                      └─{gsd-media-keys}(2596)
├─gsd-power(2507)─┬─{gsd-power}(2549)
│                 ├─{gsd-power}(2552)
│                 ├─{gsd-power}(2566)
│                 └─{gsd-power}(8942)
├─gsd-print-notif(2509)─┬─{gsd-print-notif}(2536)
│                       └─{gsd-print-notif}(2538)
├─gsd-printer(2575)─┬─{gsd-printer}(2586)
│                   └─{gsd-printer}(2598)
├─gsd-rfkill(2510)─┬─{gsd-rfkill}(2526)
│                  └─{gsd-rfkill}(2544)
├─gsd-screensaver(2511)─┬─{gsd-screensaver}(2533)
│                       └─{gsd-screensaver}(2548)
├─gsd-sharing(2521)─┬─{gsd-sharing}(2562)
│                   ├─{gsd-sharing}(2567)
│                   └─{gsd-sharing}(2579)
├─gsd-smartcard(2522)─┬─{gsd-smartcard}(2542)
│                     ├─{gsd-smartcard}(2546)
│                     └─{gsd-smartcard}(2556)
├─gsd-sound(2527)─┬─{gsd-sound}(2541)
│                 ├─{gsd-sound}(2547)
│                 └─{gsd-sound}(2571)
├─gsd-wacom(2531)─┬─{gsd-wacom}(2563)
│                 ├─{gsd-wacom}(2569)
│                 └─{gsd-wacom}(2576)
├─gsd-xsettings(4471)─┬─{gsd-xsettings}(4473)
│                     ├─{gsd-xsettings}(4474)
│                     ├─{gsd-xsettings}(4475)
│                     └─{gsd-xsettings}(4477)
├─gvfs-afc-volume(2354)─┬─{gvfs-afc-volume}(2357)
│                       ├─{gvfs-afc-volume}(2358)
│                       └─{gvfs-afc-volume}(2360)
├─gvfs-goa-volume(2366)─┬─{gvfs-goa-volume}(2369)
│                       └─{gvfs-goa-volume}(2370)
├─gvfs-gphoto2-vo(2362)─┬─{gvfs-gphoto2-vo}(2363)
│                       └─{gvfs-gphoto2-vo}(2365)
├─gvfs-mtp-volume(2350)─┬─{gvfs-mtp-volume}(2351)
│                       └─{gvfs-mtp-volume}(2353)
├─gvfs-udisks2-vo(2305)─┬─{gvfs-udisks2-vo}(2313)
│                       ├─{gvfs-udisks2-vo}(2314)
│                       └─{gvfs-udisks2-vo}(2320)
├─gvfsd(2191)─┬─gvfsd-dnssd(11501)─┬─{gvfsd-dnssd}(11502)
│             │                    └─{gvfsd-dnssd}(11503)
│             ├─gvfsd-network(11486)─┬─{gvfsd-network}(11487)
│             │                      ├─{gvfsd-network}(11488)
│             │                      └─{gvfsd-network}(11494)
│             ├─gvfsd-trash(2477)─┬─{gvfsd-trash}(2478)
│             │                   └─{gvfsd-trash}(2479)
│             ├─{gvfsd}(2199)
│             └─{gvfsd}(2200)
├─gvfsd-fuse(2204)─┬─{gvfsd-fuse}(2207)
│                  ├─{gvfsd-fuse}(2211)
│                  ├─{gvfsd-fuse}(2212)
│                  ├─{gvfsd-fuse}(2214)
│                  └─{gvfsd-fuse}(2220)
├─gvfsd-metadata(2960)─┬─{gvfsd-metadata}(2961)
│                      └─{gvfsd-metadata}(2962)
├─ibus-portal(2643)─┬─{ibus-portal}(2644)
│                   └─{ibus-portal}(2645)
├─ibus-x11(4497)─┬─{ibus-x11}(4499)
│                └─{ibus-x11}(4500)
├─pipewire(2165)───{pipewire}(2234)
├─pipewire-media-(2166)───{pipewire-media-}(2224)
├─pulseaudio(2167)─┬─{pulseaudio}(2246)
│                  ├─{pulseaudio}(2309)
│                  └─{pulseaudio}(2361)
├─seahorse(6254)─┬─{seahorse}(6272)
│                ├─{seahorse}(6273)
│                └─{seahorse}(6276)
├─sh(2499)───ibus-daemon(2532)─┬─ibus-engine-sim(2697)─┬─{ibus-engine-sim}(2699)
│                              │                       └─{ibus-engine-sim}(2700)
│                              ├─ibus-extension-(2633)─┬─{ibus-extension-}(2650)
│                              │                       ├─{ibus-extension-}(2652)
│                              │                       └─{ibus-extension-}(2653)
│                              ├─ibus-memconf(2630)─┬─{ibus-memconf}(2634)
│                              │                    └─{ibus-memconf}(2636)
│                              ├─{ibus-daemon}(2537)
│                              └─{ibus-daemon}(2559)
├─snap-store(2668)─┬─{snap-store}(2856)
│                  ├─{snap-store}(2857)
│                  ├─{snap-store}(2858)
│                  └─{snap-store}(2959)
├─snapd-desktop-i(2771)───snapd-desktop-i(2841)─┬─{snapd-desktop-i}(2842)
│                                               ├─{snapd-desktop-i}(2843)
│                                               └─{snapd-desktop-i}(2844)
├─tracker-miner-f(2242)─┬─{tracker-miner-f}(2243)
│                       ├─{tracker-miner-f}(2244)
│                       ├─{tracker-miner-f}(2245)
│                       ├─{tracker-miner-f}(2247)
│                       └─{tracker-miner-f}(2390)
├─xdg-desktop-por(2845)─┬─{xdg-desktop-por}(2846)
│                       ├─{xdg-desktop-por}(2847)
│                       ├─{xdg-desktop-por}(2915)
│                       ├─{xdg-desktop-por}(2921)
│                       ├─{xdg-desktop-por}(2922)
│                       └─{xdg-desktop-por}(28556)
├─xdg-desktop-por(2849)─┬─{xdg-desktop-por}(2851)
│                       ├─{xdg-desktop-por}(2853)
│                       ├─{xdg-desktop-por}(2854)
│                       ├─{xdg-desktop-por}(11465)
│                       └─{xdg-desktop-por}(11466)
├─xdg-desktop-por(2916)─┬─{xdg-desktop-por}(2917)
│                       ├─{xdg-desktop-por}(2919)
│                       └─{xdg-desktop-por}(2920)
├─xdg-document-po(2202)─┬─fusermount3(2221,root)
│                       ├─{xdg-document-po}(2208)
│                       ├─{xdg-document-po}(2209)
│                       ├─{xdg-document-po}(2219)
│                       ├─{xdg-document-po}(2222)
│                       ├─{xdg-document-po}(2223)
│                       └─{xdg-document-po}(28555)
└─xdg-permission-(2213)─┬─{xdg-permission-}(2215)
└─{xdg-permission-}(2217)
```

we can also see the tree of specific process

lets say you want to know the parent of sleep you run

```bash
# this command will run in process and give you the proceess id
sleep 100&
pstree -p  -s 29726
```

here you can notice systemd is the parent of all the process

```yaml
systemd(1)───systemd(2158)───gnome-terminal-(28063)───bash(28081)───sleep(29726)
```

# process-states(not discuss)

---

Now lets discuss top command

```bash
top
```

```yaml
top - 20:44:00 up  9:25,  1 user,  load average: 1.26, 1.25, 0.84
Tasks: 277 total,   2 running, 275 sleeping,   0 stopped,   0 zombie
%Cpu(s): 17.6 us,  4.4 sy,  0.0 ni, 77.9 id,  0.1 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem: 7649.9 total,    782.3 free,   3104.0 used,   3763.5 buff/cache
MiB Swap: 2048.0 total,   2048.0 free,      0.0 used.   3766.4 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  18890 muhammad  20   0 1131.0g 513944 138324 S  24.2   6.6   4:03.93 chrome
  18705 muhammad  20   0   32.7g 179660 120156 S  18.5   2.3   1:29.34 chrome
  2920 muhammad  20   0 5028000 295864 118428 S  15.6   3.8  10:58.52 gnome-shell
  18661 muhammad  20   0   32.6g 344120 196920 S   7.6   4.4   0:40.68 chrome
  19870 muhammad  20   0 1130.9g 167372 119904 S   5.7   2.1   0:09.01 chrome
  20978 muhammad  20   0  566332  56412  44064 R   5.2   0.7   0:00.44 gnome-terminal-
  2699 muhammad  20   0 2293764  29896  22460 S   3.3   0.4   6:43.10 pulseaudio
  5051 muhammad  20   0  407328  91552  58216 S   3.3   1.2   2:35.35 Xwayland
  18972 muhammad  20   0   32.8g  78204  66228 S   1.4   1.0   0:06.49 chrome
  14 root      20   0       0      0      0 I   0.5   0.0   0:21.12 rcu_sched
```

# kill command

```bash
kill process-id
```

signals in kill

```bash
kill -l
```

```yaml
1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL	 5) SIGTRAP
6) SIGABRT	 7) SIGBUS	 8) SIGFPE	 9) SIGKILL	10) SIGUSR1
11) SIGSEGV	12) SIGUSR2	13) SIGPIPE	14) SIGALRM	15) SIGTERM
16) SIGSTKFLT	17) SIGCHLD	18) SIGCONT	19) SIGSTOP	20) SIGTSTP
21) SIGTTIN	22) SIGTTOU	23) SIGURG	24) SIGXCPU	25) SIGXFSZ
26) SIGVTALRM	27) SIGPROF	28) SIGWINCH	29) SIGIO	30) SIGPWR
31) SIGSYS	34) SIGRTMIN	35) SIGRTMIN+1	36) SIGRTMIN+2	37) SIGRTMIN+3
38) SIGRTMIN+4	39) SIGRTMIN+5	40) SIGRTMIN+6	41) SIGRTMIN+7	42) SIGRTMIN+8
43) SIGRTMIN+9	44) SIGRTMIN+10	45) SIGRTMIN+11	46) SIGRTMIN+12	47) SIGRTMIN+13
48) SIGRTMIN+14	49) SIGRTMIN+15	50) SIGRTMAX-14	51) SIGRTMAX-13	52) SIGRTMAX-12
53) SIGRTMAX-11	54) SIGRTMAX-10	55) SIGRTMAX-9	56) SIGRTMAX-8	57) SIGRTMAX-7
58) SIGRTMAX-6	59) SIGRTMAX-5	60) SIGRTMAX-4	61) SIGRTMAX-3	62) SIGRTMAX-2
63) SIGRTMAX-1	64) SIGRTMAX
```

there is a lot process , when you try to kill it will not killed
for this we will have to explicitly tell to kill from kernal

kill -9 will not go to process and say stop .it will go to kernal and killed it
(there is a differnce between kill and terminate)

```bash
kill -9
```

## we can also stop a process for time being and resume it

for stoping -19 signal,
for resuming -18 signal

we can also stop killed proces by its name (usefull when you want to stop all process with same name)

```bash
pkill proceees-name
```

also we can differnernt name process

```bash
killall name1 name2
```

job command is used to watch weather a process is runnign in background or foreground

```bash
job
```

# Process Priority & Jobs

now lets talk about top command

```bash
top
```

```yaml
top - 20:44:00 up  9:25,  1 user,  load average: 1.26, 1.25, 0.84
Tasks: 277 total,   2 running, 275 sleeping,   0 stopped,   0 zombie
%Cpu(s): 17.6 us,  4.4 sy,  0.0 ni, 77.9 id,  0.1 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem: 7649.9 total,    782.3 free,   3104.0 used,   3763.5 buff/cache
MiB Swap: 2048.0 total,   2048.0 free,      0.0 used.   3766.4 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  18890 muhammad  20   0 1131.0g 513944 138324 S  24.2   6.6   4:03.93 chrome
  18705 muhammad  20   0   32.7g 179660 120156 S  18.5   2.3   1:29.34 chrome
  2920 muhammad  20   0 5028000 295864 118428 S  15.6   3.8  10:58.52 gnome-shell
  18661 muhammad  20   0   32.6g 344120 196920 S   7.6   4.4   0:40.68 chrome
  19870 muhammad  20   0 1130.9g 167372 119904 S   5.7   2.1   0:09.01 chrome
  20978 muhammad  20   0  566332  56412  44064 R   5.2   0.7   0:00.44 gnome-terminal-
  2699 muhammad  20   0 2293764  29896  22460 S   3.3   0.4   6:43.10 pulseaudio
  5051 muhammad  20   0  407328  91552  58216 S   3.3   1.2   2:35.35 Xwayland
  18972 muhammad  20   0   32.8g  78204  66228 S   1.4   1.0   0:06.49 chrome
  14 root      20   0       0      0      0 I   0.5   0.0   0:21.12 rcu_sched
```
