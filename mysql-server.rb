# mysql-server.rb

Facter.add("mysql-server") do
  setcode do
  os = Facter.value('operatingsystem')
  case os
      when "RedHat", "CentOS", "SuSE", "Fedora"
        is_installed = system 'rpm -q mysql-server'
      when "Debian", "Ubuntu"
        is_installed = system 'dpkg -s git | grep Version'
      else
   end
  end
end