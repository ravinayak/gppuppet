class gppuppet::functions{
  $elements_arr = ['tom', 'jerry', 'mac', 'john']
  $elements_hash = {
    'root'  => 'root',
    'tom'   => 'tom',
    'jerry' => 'jerry',
  }
  $elements_arr.each |String $element| {
    notice($element)
  }
  $elements_hash.each |String $key, String $value| {
    notice("Key and Value :: ${key} -- ${elements_hash[$key]}")
  }
  $hash_prep = $::element_arr.reduce({}) |$res,$val| { $res.merge('name' => $val)}
  $greeting = saymyname('Mr Anderson')
  $puppet_greeting = sayname('Mr Neo')
  notice($greeting)
  notice($puppet_greeting)
}
