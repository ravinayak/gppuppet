Puppet::functions.create_function(':gppuppet::myname') do
  dispatch :saymyname do
    param 'String', :myname
  end
  def saymyname(myname) do
    "My name is #{myname}"
  end
end