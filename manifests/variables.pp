

class gppuppet::variables(
  String $str,
  Integer $int,
  Float $float,
  Numeric $numeric,
  Boolean $bool,
  Array $arr,
  Enum['rat', 'cat', 'zebra', 'lion'] $enum,
  Hash $hash,
  Regexp $regexp,
  Undef $und,
  Type $type1_type,
  Type[Integer] $type2_integer,
  Type[String[1,100]] $type3_string_1_100,
  Type[Resource] $type4_resource,
  Type[User] $type5_user,
  Type[Integer[1,10]] $type6_integer_1_10,
  Array[String] $arr_str,
  Hash[String,Integer] $hash_str_key_val_int,
  Any $any_type,
  Variant[String, Undef] $variant_str_undef,
  Pattern[/a/,/(\w)+a.*/,/abc*/] $pattern,
  Scalar $scalar,
  Data $data,
  Collection $collection,
){
  notice("The variables are interpolated as: ${str} -- ${int} -- ${float} -- ${numeric} -- ${bool} -- ${arr} -- ${enum} -- ${hash} -- ${regexp}")
  notice("The variables are interpolated as: ${und} -- ${type1_type} -- ${type2_integer} -- ${type3_string_1_100} -- ${type4_resource}")
  notice("The variables are interpolated as: ${type5_user} -- ${type6_integer_1_10} -- ${arr_str} -- ${hash_str_key_val_int}")
}
