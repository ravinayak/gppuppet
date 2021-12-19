class gppuppet::sampleclasswithfileresourcespredefaults{
  file {"/codetestfiles/samplefilepredefault${fqdn_rand(15, 'previous sampling')}.txt":
    ensure => file,
  }
  file {"/codetestfiles/samplefilepredefault${fqdn_rand(15, 'next sampling')}.txt":
    ensure => file,
  }
}
