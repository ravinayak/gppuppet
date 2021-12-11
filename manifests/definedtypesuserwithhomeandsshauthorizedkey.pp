define gppuppet::definedtypesuserwithhomeandsshauthorizedkey(
  String $username,
  String $fileforuserinhomedir,
  String $key,
){
  $groups = ['newgroup', 'definedtypegroup']
  user { $username:
    ensure     => present,
    managehome => false,
    system     => false,
    uid        => 10002,
    gid        => 5001,
    groups     => $groups,
    allowdupe  => false,
    shell      => '/bin/bash',
  }
  group { $groups[0]:
    ensure => present,
    gid    => 5002,
  }
  group { $groups[1]:
    ensure => present,
    gid    => 5003,
  }
  file {"/home/${username}":
    ensure => directory,
    owner  => $username,
    group  => $username,
    mode   => '0755'
  }
  file {"/home/${username}/${fileforuserinhomedir}.txt":
    ensure => file,
    owner  => $username,
    group  => $username,
    mode   => '0644',
    source => 'puppet:///modules/gppuppet/samplefile.txt'
  }
  ssh_authorized_key { "${username}@localhost":
    ensure => present,
    user   => $username,
    type   => key,
    key    => $key,
  }
}
