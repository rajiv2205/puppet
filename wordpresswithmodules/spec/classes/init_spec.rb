require 'spec_helper'
describe 'wordpresswithmodules' do

  context 'with defaults for all parameters' do
    it { should contain_class('wordpresswithmodules') }
  end
end
