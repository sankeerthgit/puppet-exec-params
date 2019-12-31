class toolname (
  $install = $::toolname::params::install,
){
  include splslib
  include toolname::params
  include toolname::install
  if $install == true {
    include toolname::install
  }
}