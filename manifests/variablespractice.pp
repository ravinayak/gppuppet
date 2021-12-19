class gppuppet::variablespractice{
  include stdlib
  #$var=123
  #$var='123'
  # notice("Data Type :: ${Type[$comment]}")
  notice("Facts top level variable :: ${facts['os']['release']['full']}")
  notice("Trusted top level variable :: ${trusted['certname']}")
  # pry()
  Class{ 'gppuppet::variables':
    str                     => 'Hey there I am a string being passed through resource declaration of a class',
    int                     => 3,
    float                   => 3.5,
    numeric                 => 4.5,
    bool                    => true,
    arr                     => [1,2,3,4,5, 'is there', true],
    enum                    => 'lion',
    hash                    => { 'a' => 123, 'b' => 'Hi There'},
    regexp                  => /(\w)+abc$/,
    und                     => undef,
    type1_type              => String,
    type2_integer           => Integer[1,10],
    type3_string_1_100      => String[3,80],
    type4_resource          => File['/codetestfiles/ntp.conf'],
    type5_user              => User,
    type6_integer_1_10      => Integer[4,7],
    arr_str                 => ['los', 'angeles', 'san'],
    hash_str_key_val_int    => { 'los' => 10, 'angeles' => 50, 'min' => 100 },
    any_type                => 2.5,
    variant_str_undef       => undef,
    pattern                 => 'aabc',
    scalar                  => true,
    collection              => {'s' => 'here we go', 12 => 'ridiculous'},
    data                    => 12,
  }
}
