require 'spec_helper'

describe Strut::Model::Holder do
  context 'no option' do
    subject{ Strut::Model::Holder.new }
    its(:nil?){should be_false}
    its(:find_names){ should == Strut::ACTIONS.map{|a| a} }
  end
  context 'index2' do
    subject{ Strut::Model::Holder.new(:index=>[:index2]) }
    it{subject.find_names(:index).should==[:index2,:index] }
  end
end
