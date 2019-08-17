require 'spec_helper'
describe 'ddagentwindows' do
  context 'with default values for all parameters' do
    it { should contain_class('ddagentwindows') }
  end
end
