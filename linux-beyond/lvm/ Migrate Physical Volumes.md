# Migrate Physical Volumes

## Steps

1. create partition , PV,VG ,LV <a href = "LVM.md">Create LV</a> and format filesystem mount to dir.
1. after mounting verify through df -HT , create some content ,
1. extend before migrate

```bash
# create partion, pv in new disk,
# we actualy extend vg of that lv
vgextend dataVG /dev/sdb1
# check dependencies of disks
# it will show no. of dependecies
dmsetup deps /dev/dataVG/dataLV
# imp steps
#          lvmname (jisko)   source    target
pvmove -n dataLV  /dev/sda1  /dev/sdb1

# we can remove
vgreduce datVg /dev/sda1
```
