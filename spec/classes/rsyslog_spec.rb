require 'spec_helper'

describe 'rsyslog' do
  context 'supported operating systems' do
    [ 'Debian', 'RedHat'].each do |osfamily|
      describe "rsyslog class without any parameters on #{osfamily}" do
        let(:params) {{
          
        }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('rsyslog::params') }
        it { should contain_class('rsyslog::install').that_comes_before('rsyslog::config') }
        it { should contain_class('rsyslog::config') }
        it { should contain_class('rsyslog::service').that_subscribes_to('rsyslog::config') }

        it { should contain_service('rsyslog') }
        it { should contain_package('rsyslog').with_ensure('present') }
        it { should contain_file('/etc/rsyslog.d').with_ensure('directory')}
        it { should contain_file('/etc/rsyslog.conf').with_content(/rsyslog v5 configuration file/)}
        it { should contain_file('/etc/rsyslog.d/tcp_listen.conf').with_ensure('present')}
      end
    end
  end

  context 'unsupported operating system' do
    describe 'rsyslog class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('rsyslog') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
