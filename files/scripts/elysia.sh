#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# Clone ElysiaOS
cd /tmp
git clone https://github.com/ElysiaOS/ElysiaOS.git ely
cd ely

# .config
mkdir -p /etc/skel/
cp -rv /tmp/ely/.cache /etc/skel/.cache

# This one needs a fixup for awww
cp -rv /tmp/ely/.config /etc/skel/.config
sed -i 's/swww/awww/g' /etc/skel/.config/hypr/auto_start.conf /etc/skel/.config/hypr/Scripts/wallpaper.sh

cp -rv /tmp/ely/.floorp /etc/skel/.floorp
cp -rv /tmp/ely/.bashrc /etc/skel/.bashrc
cp -rv /tmp/ely/.zshrc /etc/skel/.zshrc

cp -rv /tmp/ely/.icons/* /usr/share/icons/
cp -rv /tmp/ely/fonts/* /usr/share/fonts/
cp -rv /tmp/ely/.themes/* /usr/share/themes/

mkdir -p /boot/grub/themes/ElysianRealm
cp -rv /tmp/ely/GRUB-THEME/ElysianRealm/* /boot/grub/themes/ElysianRealm

echo "GRUB_THEME=/boot/grub/themes/ElysianRealm/themes.txt" > /etc/default/grub

cp -rv /tmp/ely/SDDM/* /usr/share/sddm/themes/


sed -i 's/swww/awww/g' /tmp/ely/bin/wallpaper-switch.sh
cp -rv /tmp/ely/bin/* /usr/bin/
cp -v /tmp/ely/services/wallpaper-auto* /usr/lib/systemd/system/
cp -rv /tmp/ely/plymouth/themes/* /usr/share/plymouth/themes/

rm -rf /tmp/ely

plymouth-set-default-theme -R elysiaos-style2
fc-cache -fsv