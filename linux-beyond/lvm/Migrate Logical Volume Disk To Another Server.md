# Migrate Logical Volume Disk To Another Server

```bash

# it will scan disk
ls /sys/class/scsi_host/ | while read host ; do echo "- - -" z /sys/class/scsi_host/$host/scan ; done

```
