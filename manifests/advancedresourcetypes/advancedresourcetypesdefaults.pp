class gppuppet::advancedresourcetypes::advancedresourcetypesdefaults{
  # When we create a defined type within a class, we do not have to namespace it with the full location of the class in which it is 
  # contained. The class already contains namespacing of the entire location. Defined types defined within a class that contain 
  # resources of type X where defaults have been defined using Resource Reference X, seem to not depend on order of declaration of 
  # defaults. In the following example, defined type has been defined and declared before defaults, yet its file resource is impacted by
  # defaults. 
  # Files which are declared + Files which are included - before File[...] defaults are not affected by defaults declared below them
  # Files which are declared + Files which are incluced - post File[....] defaults are affected by defaults declared before them
  # --------------------------------------------------------Summary Notes------------------------------------------------------------------
  # NOTE-1: Never use Resource Reference like File[....] for defaults, always scope default to the resource for which it is meant
  # NOTE-2: For normal resources + resouces declared (using include), order in which they are declared with respect to default matters
  # NOTE-3: Resources which are declared using include into a file which contains Resource References can get affected, hence avoid using it
  # NOTE-4: Always scope defaults to the resource definition
  # NOTE-5: Default allocation of attributes can be overriden by explicit declaration of same attributes
  # NOTE-6: Declaration of defined type (or any other resource type) requires full namespacing, defining may not need depending on 
  #containment

  define defaultsdefinedtypewithinclass {
    file{"/etc/advancedresourcetypes-${title}.txt":
      ensure => file,
    }
  }
  # Although namespacing is not required while defining a defined type within class with the full location of the class in which it is 
  # defined yet while delcaring the defined type, we do need to fully namespace it. Extend this concept wherever applicable

  # defaultsdefinedtypewithinclass{ => Without namespacing it throws error

  gppuppet::advancedresourcetypes::advancedresourcetypesdefaults::defaultsdefinedtypewithinclass{

    default:
      tag => 'defaulttag';
    'default1': ;
    'default2': ;
  }
  Defaultsdefinedtypewithinclass <| tag == defaulttag |>.each |$dt_inst| {
    notice($dt_inst)
    defaultdefinedtypewithinclass { $dt_inst:
      tag => 'nomoredefaulttag',
    }
  }
  Defaultsdefinedtypewithinclass <| |>.each |$dt_inst| {
    notice($dt_inst)
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
