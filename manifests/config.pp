# == Class rsyslog::config
#
# This class is called from rsyslog
#
class rsyslog::config (
  $udp_port = $rsyslog::udp_port,
){
  file { '/etc/rsyslog.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('rsyslog/rsyslog.conf.erb'),
  }
  if $udp_port {
    file { '${conf_dir}/udp_listen.conf':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('rsyslog/udp_listen.conf.erb'),
    }
  }
}
