#!/usr/bin/env bash
apk update
apk upgrade
# x11
apk add xorg-server xf86-input-libinput eudev mesa-dri-gallium
# kde
##apk add plasma-desktop systemsettings sddm breeze okular
##apk add ark dolphin konsole spectacle
# apps
apk add nano ## konqueror ca-certificates 
# logind and other stuff
##apk add elogind polkit-elogind dbus wpa_supplicant networkmanager \
##    bluez networkmanager-wifi networkmanager-tui librsvg fuse
# pipewire
##apk add wireplumber pipewire pipewire-pulse pipewire-alsa pipewire-spa-bluez \
##    pipewire-jack pipewire-spa-tools
# remove baloo_file at startup
rm -f /etc/xdg/autostart/baloo_file.desktop
echo -e "live\nlive\n" | passwd root
rc-update add dbus
rc-update add bluetooth
rc-update add networkmanager
rc-update add wpa_supplicant
rc-update add sddm
rc-update add udev
rc-update add elogind
rc-update add fuse
# laptop stuff
apk add acpi cpufreqd pm-utils
rc-update add cpufreqd
# i915 stuff
cat > /etc/modprobe.d/i915.conf <<EOF
options i915 enable_rc6=1
options i915 enable_psr=1
options i915 enable_guc=2
options i915 enable_fbc=1
EOF
