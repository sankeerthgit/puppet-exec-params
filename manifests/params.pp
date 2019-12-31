##########################################################################
# == class: toolname::params
# Full description of class params here.
# === Variables
# Here you should define a list of variables that this module would require.
##########################################################################
class toolname::params {
  $repository_url      = 'http://repo.com/artifactory/agents'
  $archive_name        = 'install.zip'
  $version             = 'x.x.x'
  $install_path        = '/tmp/installdump'
}