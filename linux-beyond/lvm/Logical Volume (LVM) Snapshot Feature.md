# Logical Volume (LVM) Snapshot Feature

good backup method if you dont have so much change and you dont want to keep it long

```bash
lvcreate -L 1G -s -n snap-data /dev/VG/LV
```

for return our data from snapshot

```bash
unmount /data
lvconvert --merge /dev/system/snap-data
# deavtive lv
lvchange -an /dev/vg/lv
#reactive
lvchange -ay /dev/vg/lv
# mount
mount /dev/vg/lv /data
cd data
# see your data you were created
```

## if your filesystem grow you must take care of your snap

```bash
#for extend size of snap
lvextend -L +1G /dev/vg/lv/snap-data
lvremove /dev/system/snap-data
```

for size of snap rread file /dev/lvm/lvm.conf
