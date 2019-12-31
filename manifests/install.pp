##############################################################################
# Agent Install Script using Puppet Automation
# This script is intended to work with any UNIX Platform (Redhat & AIX) and doesnt work on Windows
##############################################################################
class toolname::install (
  $repository_url      = $::toolname::params::repository_url,
  $archive_name        = $::toolname::params::archive_name,
  $install_path        = $::toolname::params::install_path,
) {
  $package_source      = "${repository_url}/${archive_name}"
  file { $install_path:
    ensure => directory,
  }

##############################################################################
# Tool Install -> Setting the Install Path and ensure extract is successful
##############################################################################
  archive { $archive_name:
    path         => "${install_path}/${archive_name}",
    source       => $package_source,
    extract      => true,
    extract_path => $install_path,
    cleanup      => true,
    require      => File[$install_path],
  }

##############################################################################
# -> Script gets kicked off here
##############################################################################
  exec { 'run_install_script':
#   path        => ["/usr/bin", "/usr/sbin", "/bin/bash"],
    command     => "${install_path}/install.sh",
# -> Above can be any package source .sh .pkg .rpm etc..
    refreshonly => true,
    logoutput   => true,
    subscribe   => Archive[$archive_name],
  }
}