class gppuppet::containclassesdir::containclass2declared {
  notice('I am in containclass2declared')
  file { '/codetestfiles/containclass2.txt':
    ensure => file,
  }
}
Class{'puppetlearning::containclassesdir::containclass2declared': }
