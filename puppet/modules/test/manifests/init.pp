class test {

  include apache
  include mongodb

  file { 'motd':
    path => '/etc/motd',
    content => 'This is a test.';
  }

  package { 'nano':
    ensure => present;
  }
}
