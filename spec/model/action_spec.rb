require 'spec_helper'

describe Strut::Model::Action do
  context 'initialize' do
    subject{Strut::Model::Action.new(:aa,:bb)}
    its(:name){should==:aa}
    its(:type){should==:bb}
  end
end
