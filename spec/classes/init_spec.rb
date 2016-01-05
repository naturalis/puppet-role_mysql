require 'spec_helper'
describe 'role_mysql' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_mysql') }
  end
end
