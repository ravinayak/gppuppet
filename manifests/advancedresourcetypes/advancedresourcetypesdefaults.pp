class gppuppet::advancedresourcetypes::advancedresourcetypesdefaults{
  define defaultsdefinedtypewithinclass {
    file{"/etc/advancedresourcetypes-${title}.txt":
      ensure => file,
    }
  }
  gppuppet::advancedresourcetypes::advancedresourcetypesdefaults::defaultsdefinedtypewithinclass{
  default:
    tag => 'defaulttag';
  'default1': ;
  'default2': ;
}
  user { 'neo1':
    ensure => present,
  }

  file{'/etc/defaulttestpredefault.txt':
    ensure => file,
  }
  include gppuppet::sampleclasswithfileresourcespredefaults

  File{
    owner   => 'neo1',
    group   => 'neo1',
    mode    => '0755',
    content => 'This is a file generated through default values allocation',
  }

  include gppuppet::sampleclasswithfileresourcespostdefaults

  file{'/etc/defaulttestpostdefault.txt':
    ensure => file,
  }

  file {'/etc/overridedefaults.txt':
    ensure  => file,
    owner   => 'vagrant',
    mode    => '0644',
    content => 'This file demonstrates overwriting of default attributes'
  }
}
