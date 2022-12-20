# Restore Removed LVM With Data in Linux

1. create partition , PV,VG ,LV <a href = "LVM.md">Create LV</a> and format filesystem mount to dir.
1. after mounting
1. remmove LVM (for demo of showing )

   **unmount folder**

```bash
lvremove /dev/VG/LV
ls -ltrh /etc/lvm/archive

vgcfgrestore --list VG
# get file name
vgcfgrestore -f /etc/lvm/archive/filename-from-above-command VG
# Restored but inactive in attribute
lvs
lvscan
# question how to active ?
lvchange -ay /dev/vg/lv
# MOunt the folder again
mount /dev/vg/lv /data
# move to folder
cd /data
#check weather your file will be here
ll
```
