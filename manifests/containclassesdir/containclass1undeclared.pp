class gppuppet::containclassesdir::containclass1undeclared{
  notice('I am in containclass1undeclared')
  file{'/codetestfiles/containclass1.txt':
    ensure => file,
  }
}
