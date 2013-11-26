require 'spec_helper'

describe 'postfix::install', :type => :class do
  let(:title) { 'postfix' }

  describe 'default' do
    let(:params) { {
      :tls         => false,
      :tls_package => 'openssl'
    } }

    it { should create_class('postfix::install') }
    it { should contain_package('sendmail').with_ensure('absent') }
    it { should contain_package('postfix').with_ensure('latest') }
    it { should_not contain_package('openssl') }
  end

  describe 'with ssl' do
    let(:params) { {
      :tls         => true,
      :tls_package => 'openssl',
    } }

    it { should create_class('postfix::install') }
    it { should contain_package('sendmail').with_ensure('absent') }
    it { should contain_package('postfix').with_ensure('latest') }
    it { should contain_package('openssl').with_ensure('latest') }
  end

end
