### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
# blu_spark changes by eng.stk

### AnyKernel setup
# begin properties
properties() { '
kernel.string=### blu_spark kernelSU for OnePlus 9/Pro ###
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=OnePlus9Pro
device.name2=lemonadep
device.name3=OnePlus9ProTMO
device.name4=lemonadept
device.name5=OnePlus9
device.name6=lemonade
device.name7=OnePlus9TMO
device.name8=lemonadet
device.name9=OnePlus9VZW
device.name10=lemonadev
supported.versions=13
'; } # end properties

### AnyKernel install
# begin attributes
attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/overlay.d/*;
set_perm_recursive 0 0 750 750 $ramdisk/overlay.d/sbin;
} # end attributes

# shell variables
block=boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh && attributes;

## Trim partitions
$bin/busybox fstrim -v /data;

## AnyKernel boot install
dump_boot;

# remove old root patch avoidance hack
patch_cmdline "skip_override" "";

write_boot;
## end boot install


# shell variables
block=vendor_boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# reset for vendor_boot patching
reset_ak;

### AnyKernel install
# begin attributes
attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
} # end attributes

## AnyKernel vendor_boot install
dump_boot;

write_boot;
## end vendor_boot install
