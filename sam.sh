sudo mkdir /mnt/exnpecntrhybrissftp
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/exnpecntrhybrissftp.cred" ]; then
    sudo bash -c 'echo "username=exnpecntrhybrissftp" >> /etc/smbcredentials/exnpecntrhybrissftp.cred'
    sudo bash -c 'echo "password= oG4/bCrX40J5NVJ0Vmdc1f73pf//zMkELm4eGEWO4uTPiGBv0U8marz4FqXciezWHjknagyypkGoSetf/IzVug==" >> /etc/smbcredentials/exnpecntrhybrissftp.cred'
fi
sudo chmod 600 /etc/smbcredentials/exnpecntrhybrissftp.cred

sudo bash -c 'echo "//exnpecntrhybrissftp.file.core.windows.net/awb /retek_mule cifs nofail,vers=3.0,credentials=/etc/smbcredentials/exnpecntrhybrissftp.cred,dir_mode=0777,file_mode=0777,serverino" >> /etc/fstab'
