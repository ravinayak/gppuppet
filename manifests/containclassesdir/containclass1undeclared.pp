class gppuppet::containclassesdir::containclass1undeclared{
  notice('I am in containclass1undeclared')
  #file{'/home/neo/codetestfiles/containclass1.txt':
  # Above file location should be used when you are running on your local machine and not vagrant
  file{'/codetestfiles/containclass1.txt':
    ensure => file,
  }
}
