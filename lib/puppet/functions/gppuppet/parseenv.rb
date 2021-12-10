Puppet::Functions.create_function(:'gppuppet::parseenv') do
  dispatch :parseenv do
    param 'String', :hostname
  end
  def parseenv(hostname)
    env = case hostname
    when /[^\-]+-p-\d+/
      'Production'
    when /[^\-]+-d-\d+/
      'Development'
    when /[^\-]+-t-\d+/
      'Test'
    else
      'Unknown Environment'
    end
    "My environment is :: #{env}"
  end
end