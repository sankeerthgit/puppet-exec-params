# puppet-exec-params
Puppet module for install and execute commands using params file.

A Puppet module to install and execute commands using params file.

Basic usage

To install any exec package using puppet:

exec { 'run_install_script': command => "${install_path}/install.sh",