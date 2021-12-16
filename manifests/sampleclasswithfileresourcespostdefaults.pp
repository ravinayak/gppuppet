class gppuppet::sampleclasswithfileresourcespostdefaults{
  include stdlib
  file {"/etc/samplefilepostdefault${fqdn_rand(15, 'sampling')}.txt":
    ensure => file,
  }
  file {"/etc/samplefilepostdefaults${fqdn_rand(15, 'newsampling')}.txt":
    ensure => file,
  }
}
