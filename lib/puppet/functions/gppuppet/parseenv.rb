Puppet::Functions.create_function(:'gppuppet::parseenv') do
  dispatch :parseenv do
    param 'String', :hostname
  end
  def parseenv(hostname) do
    env = hostname? {
      # /[^\-]+-p-\d+/ => 'Production',
      # /[^\-]+-d-\d+/ => 'Development',
      # /[^\-]+-t-\d+/ => 'Test'.
      # default => 'Unknown Environment',
    }
    "My environment is :: #{env}"
  end
end