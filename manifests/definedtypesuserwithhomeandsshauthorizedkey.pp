define gppuppet::definedtypesuserwithhomeandsshauthorizedkey(
  String $username,
  Variant[String, Integer] $uid,
  Variant[String, Integer] $gid,
  String $fileforuserinhomedir,
  String $key_type,
  String $key,
){
  $groups = ['newgroup', 'definedtypegroup', $username]
  group { $username:
    ensure => present,
    gid    => $gid,
    system => false,
  }
  group { $groups[0]:
    ensure => present,
    gid    => 5002,
  }
  group { $groups[1]:
    ensure => present,
    gid    => 5003,
  }
  user { $username:
    ensure     => present,
    managehome => false,
    system     => false,
    uid        => $uid,
    gid        => 5001,
    groups     => $groups,
    allowdupe  => false,
    shell      => '/bin/bash',
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
    type   => $key_type,
    key    => $key,
  }
  Group[$groups[0], $groups[1], $groups[2]] -> User[$username] -> File["/home/${username}", "/home/${username}/${fileforuserinhomedir}.txt"]
  -> Ssh_authorized_key["${username}@localhost"]
}
