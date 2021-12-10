function parseenvironment(String $hostnmae) {
  $env = hostname? {
      /[^\-]+-p-\d+/ => 'Production',
      /[^\-]+-d-\d+/ => 'Development',
      /[^\-]+-t-\d+/ => 'Test'.
      default => 'Unknown Environment',
    }
  "My environment - Puppet function :: ${env}"
}
