# Filesystems & Mounting in Linux

### what is a file system?

A way of organizing file in your partition, it has many types mostly used
ext2,ext3,ext4, xfs

#### disadvntage of ext2

1. ext2 took too much time on file check
1. No journaling

<b>Journaling</b> feature introduced in ext3

<b> /sbin/mkfs, /sbin/mke2fs is file which help us to create filesystems </b>

xfs is support journaling and other features

vfat is supprted in lunux but has security issue , and point to remember is that every OS support vfat file system mean it is used in USB, and differnt cameras etc.

iso 9660 use for iso images of cd amd dvd

<b> swap is a space not a file system </b>

There is a lot of binaries file inside /sbin which is used to create a filesystem

### lets create a file system in your disk (or in partition)

```bash
mke2fs /dev/xvdf
# another way is that to use mkfs.
mkfs.ext2 /dev/xvdf
```

### tune2fs

### fstab (for mount in boot time (self learning ))
