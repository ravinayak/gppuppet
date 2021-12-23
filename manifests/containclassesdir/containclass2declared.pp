class gppuppet::containclassesdir::containclass2declared {
  notice('I am in containclass2declared')
  #file{'/home/neo/codetestfiles/containclass2.txt':
  # Above file location should be used when you are running on your local machine and not vagrant
  file { '/codetestfiles/containclass2.txt':
    ensure => file,
  }
}
Class { 'gppuppet::containsclassesdir::containsclass2declared': }
