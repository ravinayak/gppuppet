class gppuppet::conditionals(
  String $host='oadb-p-0012',
  String $bool_str='',
  String $case_var = 'qa'
){
    $host = 'oadb-p-00012'
    $bool_str = undef
    $case_var = 'qa'
    if $host =~ /[^\-]+-p-\d+/ {
      notice('The regex is a match')
      $param1 = 'king'
      $param2 = 'queen'
      notice("Multiple parameters assignment can be done using if/else :: ${param1} -- ${param2}")
    } else {
      notice('Regex is not a match')
    }

    if $bool_str {
      notice('String is a truthy')
    } else {
      notice('String is a falsey')
    }

    case $case_var {
      'prod': {
        $param1='prince'
        $param2='baby'
        notice("Multiple assignments done using case :: ${param1} -- ${param2}")
      }
      default: {
        notice('nothing matched, I am in default')
      }
  }
}
