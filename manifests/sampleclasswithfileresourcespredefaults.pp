class gppuppet::sampleclasswithfileresourcespredefaults{
  file {"/etc/samplefilepredefault${fqdn_rand(15, 'previous sampling')}.txt":
    ensure => file,
  }
  file {"/etc/samplefilepredefault${fqdn_rand(15, 'next sampling')}.txt":
    ensure => file,
  }
}
