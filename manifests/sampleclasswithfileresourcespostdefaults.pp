class gppuppet::sampleclasswithfileresources{
  include stdlib
  file {"/etc/samplefilepredefault${fqdn_rand(15, 'sampling')}.txt":
    ensure => file,
  }
  file {"/etc/samplefiletest${fqdin_rand(15, 'newsampling')}.txt":
    ensure => file,
  }
}
