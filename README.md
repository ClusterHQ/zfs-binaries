# ZFS on container operating systems

This repository contains ClusterHQ-built ZFS on Linux binary "releases" (tarballs) for some interesting container-related Linux distributions:

* CoreOS
* RancherOS (coming soon)

## CoreOS

The releases are built automatically from a set of CoreOS clusters tracking alpha, beta and stable CoreOS channels.

Therefore (so long as CoreOS promote their kernels from alpha => beta, etc) it ought to be possible to install these modules on any beta or stable channel CoreOS host.
Our automated builds on alpha should have happened by the time a promotion from alpha => beta happens.

So: to install ZFS on CoreOS and load the kernel modules, you should be able to run the following one-liner:

```
core@core-01 ~ $ curl -s https://raw.githubusercontent.com/ClusterHQ/zfs-binaries/master/fetch.sh |sh
```

This just downloads the release (~15MB) appropriate to your current running kernel to your CoreOS home directory (`/home/core`), unpacks it there and then loads the kernel modules.

### Known issues

We intend to fix these issues:

* Kernel modules do not load automatically after a reboot.
* New kernel modules are not automatically fetched when CoreOS upgrades itself.

If you have any other problems let us know!

## RancherOS

Coming soon - raise an issue to let us know if you're interested.

## Using ZFS

Once you've loaded the kernel modules, you should be able to use the usual ZFS tools.
For example, you can create a toy pool-in-a-file as follows:

```
$ sudo truncate -s 10G /var/lib/zfs-pool
$ sudo zpool create tank /var/lib/zfs-pool
$ sudo zfs create tank/filesystem
$ sudo zfs snapshot tank/filesystem@now
```

You can also try using [Flocker](https://clusterhq.com/) using these releases.

Enjoy!
