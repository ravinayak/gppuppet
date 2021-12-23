class gppuppet::containclassesdir::containclass2declared {
  notice('I am in containclass2declared')
  #file{'/home/neo/codetestfiles/containclass2.txt':
  # Above file location should be used when you are running on your local machine and not vagrant
  file { '/codetestfiles/containclass2.txt':
    ensure => file,
  }
}
# Class { 'gppuppet::containclassesdir::containclass2declared': }
# The above line works because it references its own class in file and not classes outside its files. Question of auto loading of 
# classes in module layout arises when a class references another class outside its file
