# mysql-server.rb

os = Facter.value('operatingsystem')
  case os
      when "RedHat", "CentOS", "SuSE", "Fedora"
        result = %x{/bin/rpm -qa --queryformat "%{VERSION}-%{RELEASE}" mysql-server}
when "Debian", "Ubuntu"
        result = %x{dpkg -s git | grep Version}
end

Facter.add('mysql-server') do
    setcode do
        result
    end
end