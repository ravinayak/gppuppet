class gppuppet::containtest{
  contain gppuppet::containclassesdir::containclass1undeclared
  # This class is being declared and then included through contain function call
  Class{'puppetlearning::containclassesdir::containclass2declared': }
  contain gppuppet::containclassesdir::containclass2declared
  include gppuppet::containclassesdir::includeclassexample
}
# Class {'gppuppet::containtest': } : Declaring this here will lead to an evaluation error that the referenced class could not be
# found on node. This error is because of 2 reasons:
#   Reason 1: Classes are autoloaded only when they are in modules and are being referenced from class containing those modules
#   Reason 2: Even if you configure modulepath in /etc/puppetlabs/code/environments/<environment.conf>:
#             modulepath=<new-module-path>:$basemodulepath
#             [ modulepath=/etc/puppetlabs/code/environments/production/puppetlearning/modules:$basemodulepath ]
#             This modulepath is used to search for modules which are to be loaded, meaning manifests of these modules are to be
#             available in memory so that they can be autoloaded when referenced. Thus only classes that contain modules can 
#             declare instances of those classes through include or resource like syntax
# Error: Evaluation Error: Error while evaluating a Function Call, Could not find class 
# ::gppuppet::containclassesdir::containclass1undeclared for maverick
