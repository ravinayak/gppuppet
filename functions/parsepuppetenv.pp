function gppuppet::parsepuppetenv(String $hostname) >> String{
  $env = hostname ? {
      /[^\-]+-p-[^\-]+/ => 'Production',
      /[^\-]+-d-[^\-]+/ => 'Development',
      /[^\-]+-t-[^\-]+/ => 'Test',
      default => 'Unknown Environment',
    }
  "My environment - Puppet function :: ${env}"
}
