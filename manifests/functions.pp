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
  $hash_prep = $elements_arr.reduce({}) |$res,$element| { $res.merge('name' => $element)}
  $greeting = gppuppet::saymyname('Mr. Anderson')
  $puppet_greeting = gppuppet::sayname('Mr Neo')
  notice($greeting)
  notice($puppet_greeting)

  $env = gppuppet::parseenv('oradb-p-001234')
  $puppet_env = gppuppet::parseenvironment('oradb-d-001')
  notice($env)
  notice($puppet_env)
}
