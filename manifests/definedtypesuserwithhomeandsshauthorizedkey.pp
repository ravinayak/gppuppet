define gppuppet::definedtypesuserwithhomeandsshauthorizedkey(
  String $username,
  Variant[String, Integer] $uid,
  Variant[String, Integer] $gid,
  Array[Integer] $group_gids,
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
      gid    => $group_gids[0],
    }
    group { $groups[1]:
      ensure => present,
      gid    => $group_gids[1],
    }
    user { $username:
      ensure     => present,
      managehome => false,
      system     => false,
      uid        => $uid,
      gid        => $gid,
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
    file {"/home/${username}/${fileforuserinhomedir}":
      ensure => file,
      owner  => $username,
      force  => true,
      purge  => true,
      group  => $username,
      mode   => '0644',
      source => 'puppet:///modules/gppuppet/samplefile.txt'
    }
    ssh_authorized_key { $username:
      ensure => present,
      user   => $username,
      type   => $key_type,
      key    => $key,
    }
    ssh_authorized_key { "vagrant@${username}":
    ensure => present,
    user   => 'vagrant',
    type   => $key_type,
    key    => $key,
    }
  Group[$groups[0], $groups[1], $groups[2]] -> User[$username] -> File["/home/${username}", "/home/${username}/${fileforuserinhomedir}"]
  -> Ssh_authorized_key["${username}"]
  # Group[$groups[0], $groups[1]] -> User[$username] -> Group[$groups[2]] -> File["/home/${username}", "/home/${username}/${fileforuserinhomedir}"]
  # -> Ssh_authorized_key["${username}"]
}
