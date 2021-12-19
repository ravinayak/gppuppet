class gppuppet::sampleclasswithfileresourcespostdefaults{
  include stdlib
  file {"/codetestfiles/samplefilepostdefault${fqdn_rand(15, 'sampling')}.txt":
    ensure => file,
  }
  file {"/codetestfiles/samplefilepostdefaults${fqdn_rand(15, 'newsampling')}.txt":
    ensure => file,
  }
}
