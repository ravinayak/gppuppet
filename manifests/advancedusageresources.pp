class gppuppet::advancedusageresources(

){
  # Below is an example of usage of files which should be avoided because it assigns values to attributes of a resource for all resources
  # within the scope of the file. Although it looks relatively harmless because only resources of specific type - i.e Resource - are 
  # supposedo be affected, however, any resources of the same specific type that are included in this file through an include call are 
  # also defaulted to have same values as declared within the file
  # A better way is to use *defaults* within the resource. This however causes difficulty in readability of code. Best Practices book 
  # has some recommendations for this usage
  # File {
  #   ensure => file,
  #   owner  => 'root',
  #   group  => 'root',
  #   source => 'puppet:///modules/gppuppet/samplefile.txt',
  #   mode   => '0777',
  # }
  # include gppuppet::sampleclasswithfileresourcespredefaults

  # file {
  #   '/codetestfiles/file1.txt':
  #     mode      => '0644',
  #     show_diff => true;
  #   '/codetestfiles/file2.txt':
  #     mode      => '0644',
  #     show_diff => true;
  #   '/codetestfiles/file3.txt':
  #     show_diff => true;
  # }
  # file {
  #   default:
  #     ensure => file,
  #     owner  => 'root',
  #     group  => 'root',
  #     source => 'puppet:///modules/gppuppet/samplefile.txt',
  #     mode   => '0644';
  #     '/codetestfiles/file1.txt':
  #       show_diff => true;
  #     '/codetestfiles/file2.txt':
  #       show_diff => true;
  #     '/codetestfiles/file3.txt':
  #       show_diff => true;
  # }
  $attrs = {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gppuppet/samplefile.txt',
  }
  file{
    '/codetestfiles/file4.txt':
      * => $attrs,
  }
}
