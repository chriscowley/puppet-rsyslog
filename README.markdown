[![Build Status](https://travis-ci.org/chriscowley/puppet-rsyslog.svg?branch=master)](https://travis-ci.org/chriscowley/puppet-rsyslog)


##Overview

Installs Rsyslog on RHEL type OS.

##Module Description

Installs Rsyslog from the package manager. With no variables it will perform local logging.


### TODO

* Install a central logging server
* Sending logs to a central server

##Setup

###What rsyslog affects

The `rsyslog` package is installed. A config file `/etc/rsyslog.conf` is created, along with `/etc/rsyslog.d` to store extra config.

Currently, this is very RHEL-centric. It should work on Debian, but the placement of log files will change to those of RHEL. For example, instead of logging to `/var/log/syslog` it will log to `/var/log/messages` as on RHEL. This may cause unforseen consequences.

###Setup Requirements **OPTIONAL**

You need to have puppet-stdlib installed.

###Beginning with rsyslog

The most basic is:
```
class { 'rsyslog': }
```

##Usage

### rsyslog

Installs packages and configures the daemon. The defaults are sane for a single RHEL server.

##Limitations

In theory, this should be fine for either RHEL type systems or Debian type systems. In practise I am a RHEL/CentOS guy, so I test mainly on that. For now the template used for the base configuration file is pretty much that shipped in the RHEL package, so it will change the log file names in Debian. This may have not knock-on effects, but it may do.

TL;DR: Debian and Ubuntu people use at your own risk.

##Development

Feel free to fork. Push any changes back and please include tests for what you change.
