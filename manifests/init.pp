# == Class: rsyslog
#
# Full description of class rsyslog here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class rsyslog (
  $package_name = $rsyslog::params::package_name,
  $service_name = $rsyslog::params::service_name,
) inherits rsyslog::params {

  # validate parameters here

  class { 'rsyslog::install': } ->
  class { 'rsyslog::config': } ~>
  class { 'rsyslog::service': } ->
  Class['rsyslog']
}
