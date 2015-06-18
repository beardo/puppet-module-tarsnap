Puppet Tarsnap Module
=====================

Module for configuring Tarsnap.

Tested on Debian GNU/Linux 6.0 Squeeze and Ubuntu 12.04 LTS with
Puppet 2.6. Patches for other operating systems welcome.

TODO
----

* Add tarsnap user and use it to run backups from.


Installation
------------

Clone this repo and all its dependencies to respective directories under
your Puppet modules directory:

    git clone git://github.com/xironix/puppet-module-tarsnap.git
    git clone git://github.com/xironix/puppet-module-tarsnap.git tarsnap

If you don't have a Puppet Master you can create a manifest file
based on the notes below and run Puppet in stand-alone mode
providing the module directory you cloned this repo to:

    puppet apply --modulepath=modules test_tarsnap.pp
