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
  # Note 7: Resource Collectors cannot be used for iteration over searched resources. A resource such as file which is found and collected
  #         a resource collector is not an element of an array, or a key-value pair of hash that can be iterated over. Confirm this?
  # NOTE 8: Resource Collectors can only be used in chaining expressions and no other expression. Using an each etc causes issues
  # NOTE 9: Parent Scope and Local Scope issues come up when we use Resource References. If we scope all defaults to specific resources, then
  #         this question should not arise
  # NOTE 10:

  define defaultsdefinedtypewithinclass {
    file{"/codetestfiles/advancedresourcetypes-${title}.txt":
      ensure => file,
      owner  => neo44,
    }
  }
  # Although namespacing is not required while defining a defined type within class with the full location of the class in which it is 
  # defined yet while delcaring the defined type, we do need to fully namespace it. Extend this concept wherever applicable

  # defaultsdefinedtypewithinclass{ => Without namespacing it throws error
  # Clearly in the debug output shown below, we can see that defined type is evaluated in the end (not application but evaluation) once all other
  # resources in the class have been evluated
  # Debug: /Stage[main]/Gppuppet::Sampleclasswithfileresourcespostdefaults/File[/codetestfiles/samplefilepostdefault6.txt]: Adding autorequire relationship with User[neo11]
  # Debug: /Stage[main]/Gppuppet::Sampleclasswithfileresourcespostdefaults/File[/codetestfiles/samplefilepostdefaults7.txt]: Adding autorequire relationship with User[neo11]
  # Debug: /Stage[main]/Gppuppet::Advancedresourcetypes::Advancedresourcetypesdefaults/File[/codetestfiles/defaulttestpostdefault.txt]: Adding autorequire relationship with User[neo11]
  # Debug: /Stage[main]/Gppuppet::Advancedresourcetypes::Advancedresourcetypesdefaults/Gppuppet::Advancedresourcetypes::Advancedresourcetypesdefaults::Defaultsdefinedtypewithinclass[default1]/File[/codetestfiles/advancedresourcetypes-default1.txt]: Adding autorequire relationship with User[neo11]
  # Debug: /Stage[main]/Gppuppet::Advancedresourcetypes::Advancedresourcetypesdefaults/Gppuppet::Advancedresourcetypes::Advancedresourcetypesdefaults::Defaultsdefinedtypewithinclass[default2]/File[/codetestfiles/advancedresourcetypes-default2.txt]: Adding autorequire relationship with User[neo11]
    gppuppet::advancedresourcetypes::advancedresourcetypesdefaults::defaultsdefinedtypewithinclass{

    default:
      tag => 'defaulttag';
    'default1': ;
    'default2': ;
  }

  user {'neo44':
    ensure => present,
  }

  file {'/codetestfiles/compareorderwithdefinedtypebasedondefault_before.txt':
    ensure  => file,
    content => 'file is created before default1 and default2 defined types',
    owner   => 'root',
  }

  file {'/codetestfiles/compareorderwithdefinedtypebasedondefault_after.txt':
    ensure  => file,
    content => 'file is created after default1 and default2 defined types',
    owner   => 'root',
  }

  # Apparently, Resource collectors can only be used in 
  File['/codetestfiles/compareorderwithdefinedtypebasedondefault_before.txt']
  -> User['neo44']
  -> Gppuppet::Advancedresourcetypes::Advancedresourcetypesdefaults::Defaultsdefinedtypewithinclass <| tag == defaulttag |>
  -> File['/codetestfiles/compareorderwithdefinedtypebasedondefault_after.txt']

  #Gppuppet::Advancedresourcetypes::Advancedresourcetypesdefaults::Defaultsdefinedtypewithinclass <| |>

  user { 'neo11':
    ensure => present,
  }

  file{'/codetestfiles/defaulttestpredefault.txt':
    ensure => file,
  }
  include gppuppet::sampleclasswithfileresourcespredefaults

  File{
    owner   => 'neo11',
    group   => 'neo11',
    mode    => '0755',
    content => 'This is a file generated through default values allocation',
  }

  include gppuppet::sampleclasswithfileresourcespostdefaults

  file{'/codetestfiles/defaulttestpostdefault.txt':
    ensure => file,
  }

  file {'/codetestfiles/overridedefaults.txt':
    ensure  => file,
    owner   => 'vagrant',
    mode    => '0644',
    content => 'This file demonstrates overwriting of default attributes'
  }
}
