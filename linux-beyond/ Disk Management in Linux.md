# Disk Management in Linux

lsblk -> list block

```bash
lsblk
```

```yaml
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0      7:0    0 24.4M  1 loop /snap/amazon-ssm-agent/6312
loop1      7:1    0 55.6M  1 loop /snap/core18/2632
loop2      7:2    0 63.2M  1 loop /snap/core20/1695
loop3      7:3    0  103M  1 loop /snap/lxd/23541
loop4      7:4    0 49.6M  1 loop /snap/snapd/17883
xvda     202:0    0    8G  0 disk
├─xvda1  202:1    0  7.9G  0 part /
├─xvda14 202:14   0    4M  0 part
└─xvda15 202:15   0  106M  0 part /boot/efi
```

```bash
sudo fdisl -l
```

```yaml
Disk /dev/loop0: 24.39 MiB, 25571328 bytes, 49944 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 55.58 MiB, 58281984 bytes, 113832 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop2: 63.24 MiB, 66314240 bytes, 129520 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop3: 102.98 MiB, 107986944 bytes, 210912 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop4: 49.62 MiB, 52031488 bytes, 101624 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/xvda: 8 GiB, 8589934592 bytes, 16777216 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: B28BC60D-C864-49DB-A9FF-7B6FF9BCC625

Device       Start      End  Sectors  Size Type
/dev/xvda1  227328 16777182 16549855  7.9G Linux filesystem
/dev/xvda14   2048    10239     8192    4M BIOS boot
/dev/xvda15  10240   227327   217088  106M EFI System

Partition table entries are not in disk order.
ubuntu@ip-172-31-87-93:~$
```

disk related info from kernal

```bash
dmesg
```

for more information

```bash
lshw
lsscsi
```

# Make disk unable to recover data

```bash
badblock -ws dev/sda
```

```bash
dd if =/dev/zero of   /dev/sda
```

## disk info as a file in linux

```bash
ls -l /dev/sda # or name of your block device
```

when you add disk sometime system dont know about that you have to tell kernal for sancing you need loop (google it)

## partioning in linux demo

first get info about new disk

if you use fdisk utility to create partitions , we use fdisk as MBR (only 4 primary partition)

(self learn differnce between gpt (not AI) and mbr in disk )

but wait why we even need partitions ? because one reason could be that you only want to use to use 10gb from 1tb disk

```bash
fdisk -l /dev/xvdf
```

```yaml
Disk /dev/xvdf: 100 GiB, 107374182400 bytes, 209715200 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

also we can see the file

```bash
ls -l /dev/xvdf
```

```yaml
brw-rw---- 1 root disk 202, 80 Dec 19 04:57 /dev/xvdf
```

## now lets create

```bash
sudo fdisk /dev/xvdf
```

```yaml
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1):
First sector (2048-209715199, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-209715199, default 209715199): +5G

Created a new partition 1 of type 'Linux' and of size 5 GiB.

Command (m for help): t
Selected partition 1
Hex code or alias (type L to list all): 8e
Changed type of partition 'Linux' to 'Linux LVM'.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

```

incase linux does not notice or show you can run partprobe disk-name

```bash
partprobe disk-name
```

now if you run lsblk again you will see a partition in xvdf

```yaml
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0      7:0    0 24.4M  1 loop /snap/amazon-ssm-agent/6312
loop1      7:1    0 55.6M  1 loop /snap/core18/2632
loop2      7:2    0 63.2M  1 loop /snap/core20/1695
loop3      7:3    0  103M  1 loop /snap/lxd/23541
loop4      7:4    0 49.6M  1 loop /snap/snapd/17883
xvda     202:0    0    8G  0 disk
├─xvda1  202:1    0  7.9G  0 part /
├─xvda14 202:14   0    4M  0 part
└─xvda15 202:15   0  106M  0 part /boot/efi
xvdf     202:80   0  100G  0 disk
└─xvdf1  202:81   0    5G  0 part
```

now lets create another partition of 7 KiB

```bash
sudo fdisk /dev/xvdf
```

```yaml
Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): n
Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (2-4, default 2):
First sector (10487808-209715199, default 10487808):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (10487808-209715199, default 209715199): +13

Created a new partition 2 of type 'Linux' and of size 7 KiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

now see in details from fdisk

```bash
sudo fdisk -l /dev/xvdf
```

```yaml
Disk /dev/xvdf: 100 GiB, 107374182400 bytes, 209715200 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x755a5b64

Device     Boot    Start      End  Sectors Size Id Type
/dev/xvdf1          2048 10487807 10485760   5G 8e Linux LVM
/dev/xvdf2      10487808 10487821       14   7K 83 Linux
/dev/xvdf3      10489856 31461375 20971520  10G 83 Linux

```

you can not create more then 4 primary partiotion

extended partitionis a type of primary partition which can further contain logical parttions init

after creating further partion by utilizing extended

```yaml
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0      7:0    0 24.4M  1 loop /snap/amazon-ssm-agent/6312
loop1      7:1    0 55.6M  1 loop /snap/core18/2632
loop2      7:2    0 63.2M  1 loop /snap/core20/1695
loop3      7:3    0  103M  1 loop /snap/lxd/23541
loop4      7:4    0 49.6M  1 loop /snap/snapd/17883
xvda     202:0    0    8G  0 disk
├─xvda1  202:1    0  7.9G  0 part /
├─xvda14 202:14   0    4M  0 part
└─xvda15 202:15   0  106M  0 part /boot/efi
xvdf     202:80   0  100G  0 disk
├─xvdf1  202:81   0    5G  0 part
├─xvdf2  202:82   0    1M  0 part
├─xvdf3  202:83   0   10G  0 part
├─xvdf4  202:84   0    1K  0 part
└─xvdf5  202:85   0   17G  0 part
```

here fdisk will come handy

```yaml
Disk /dev/xvdf: 100 GiB, 107374182400 bytes, 209715200 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x755a5b64

Device     Boot    Start       End   Sectors Size Id Type
/dev/xvdf1          2048  10487807  10485760   5G 8e Linux LVM
/dev/xvdf2      10487808  10489855      2048   1M 83 Linux
/dev/xvdf3      10489856  31461375  20971520  10G 83 Linux
/dev/xvdf4      31461376 209715199 178253824  85G  5 Extended
/dev/xvdf5      31463424  67115007  35651584  17G 83 Linux

```

Now you have added disk and create a partition , can you use space in your new disk now ?
No, lets see

you will have to assign a directory that can store data and its only happen when you crerate a filke system

there is a lot of filesystem (thats where we format (not delete format))

mkfs.xfs /dev/xvdf1
lsblk -f

```yaml
NAME     FSTYPE   FSVER LABEL           UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
loop0    squashfs 4.0                                                              0   100% /snap/amazon-ssm-agent/6312
loop1    squashfs 4.0                                                              0   100% /snap/core18/2632
loop2    squashfs 4.0                                                              0   100% /snap/core20/1695
loop3    squashfs 4.0                                                              0   100% /snap/lxd/23541
loop4    squashfs 4.0                                                              0   100% /snap/snapd/17883
xvda
├─xvda1  ext4     1.0   cloudimg-rootfs 687fab62-1ba5-4282-890e-9266064f7d27      6G    20% /
├─xvda14
└─xvda15 vfat     FAT32 UEFI            B2B4-82AC                              99.1M     5% /boot/efi
xvdf
├─xvdf1  xfs                            5dbab1b9-ce73-4197-8206-a914df683012
├─xvdf2
├─xvdf3
├─xvdf4
└─xvdf5
```

Now we can finally mount

```bash
mount /dev/xvdf1 /data
```

How to know taht you have mounted succefully ?

```bash
df
```

now move to our newly mounted folder and new disk

```bash
cd /data
touch test{1..100}
```

now unmount

```bash
umount /data
```

conclusion so far: you mount where u want to use disk partioion and unmount

PS note :
for knowing virtual or physical
sudo dmidecode -t1
