function parsepuppetenv(String $hostname) {
  $env = $hostname ? {
    /[^\-]+-p-\d+/ => 'Production',
    /[^\-]+-d-\d+/ => 'Development',
    /[^\-]+-q-\d+/ => 'QA',
    default        => 'Unknown Environment',
  }
  notice("My environment is :: ${env}")
}
