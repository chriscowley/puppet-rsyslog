# == Class rsyslog::config
#
# This class is called from rsyslog
#
class rsyslog::config (
  $udp_port = $rsyslog::udp_port,
  $tcp_port = $rsyslog::tcp_port,
  $conf_template = $rsyslog::conf_template,
  $conf_dir      = $rsyslog::conf_dir,
){
  file { '/etc/rsyslog.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("rsyslog/${conf_template}"),
  }
  if $udp_port {
    file { "${conf_dir}/udp_listen.conf":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('rsyslog/udp_listen.conf.erb'),
    }
  }
  if $tcp_port {
    file { "${conf_dir}/tcp_listen.conf":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('rsyslog/tcp_listen.conf.erb'),
    }
  }
}
