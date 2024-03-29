# Class:: postfix::params
#
#
class postfix::params {
  $smtp_relay                   = false
  $relay_host                   = $::domain
  $mydomain                     = $::domain
  $relay_networks               = '127.0.0.1'
  $relay_domains                = ''
  $relay_username               = ''
  $relay_password               = ''
  $relay_port                   = 25
  $tls                          = false
  $logging                      = ''
  $monitoring                   = ''
  $master_config_services       = []
  $main_options_hash            = hash([])
  $smtpd_client_restrictions    = 'permit_mynetworks, reject'
  $smtpd_helo_restrictions      = undef
  $smtpd_sender_restrictions    = undef
  $smtpd_recipient_restrictions = 'permit_mynetworks, reject_unauth_destination'
  $smtpd_data_restrictions      = 'reject_unauth_pipelining'

  case $::osfamily {
    'RedHat': {
      $tls_bundle = '/etc/pki/tls/certs/ca-bundle.crt'
      $tls_package = 'openssl'
    }
    'Debian': {
      $tls_bundle = '/etc/ssl/certs/ca-certificates.crt'
      $tls_package = 'ca-certificates'
    }
    default: {
      $tls_bundle = false
      $tls_package = false
    }
  }
} # Class:: postfix::params
