class gppuppet::sampleclasswithfileresources{
  file {'/etc/samplefiletest1.txt':
    ensure  => file,
    owner   => 'neo1',
    group   => 'neo1',
    mode    => '0777',
    content => "Sample File -1",
  }
  file {'/etc/samplefiletest2.txt':
    ensure  => file,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0755',
    content => 'Sample File -2',
  }
}
