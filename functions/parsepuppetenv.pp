function gppuppet::parsepuppetenv(String $hostname) >> String{
  $env = 'oradb-p-001222' ? {
      /[^\-]+-p-[^\-]+/ => 'Production',
      /[^\-]+-d-[^\-]+/ => 'Development',
      /[^\-]+-t-[^\-]+/ => 'Test',
      default => 'Unknown Environment',
    }
  "My environment - Puppet function :: ${env}"
}
