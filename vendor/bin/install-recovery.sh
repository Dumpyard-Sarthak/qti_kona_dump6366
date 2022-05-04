#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:d4e1faa64fb58884958a15a17ff28f7483c55ae5; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:54d432ab256adbf34b28cf59d2b44b743e62b488 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:d4e1faa64fb58884958a15a17ff28f7483c55ae5 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
