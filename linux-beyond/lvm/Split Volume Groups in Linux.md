# Merge/Split Volume Groups in Linux

## steps for merging

### prerequiset

1. create partition , PV,VG ,LV <a href = "LVM.md">Create LV</a> and format filesystem mount to dir.

1. create two pv,lg,lv and mount it to two differnt direcotry test1, test2

1. create some data in both folder

## Actual steps

```bash
# umount both folder
umount test*
#check weatrher unmounted or not
df -hT
# deactive vg that will be merged
# run scan to see all will be active
lvscan
vgchange -an vg2
# now scan again you will see one lv will be inactivr
lvscan
# merging
vgmerge vg1 (jis k sath ) vg2 ( jisko kr rhy)
# final step is to reactivate lv2
lvchange -ay dev/vg/lv2
```

## steps for spliting

```bash
#unmount as usual
# deactive  vg
vgchange -an vg1
vgsplit vg1 (old) vg2 (new) /dev/sda2 (with which PV)
#activeate again
vgchange -ay vg1 vg2
```
