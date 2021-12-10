Puppet::Functions.create_function(:'gppuppet::saymyname') do
  dispatch :saymyname do
    param 'String', :myname
  end
  def saymyname(myname) do
    "My name is #{myname}"
  end
end