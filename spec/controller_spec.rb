require 'spec_helper'

describe Strut::Controller do
  before do
  #  class String
  #    def tablize; "bs"; end
  #    def underscore; "b"; end
  #  end
  #  class B; end
  #  class A
  #    def self.before_filter name,options={}
  #    #  puts name
  #    end
  #    include Strut::Controller
  #    strut_controller B
  #  end
    @a = UsersController.new
  end
  it{@a.methods.include?(:find_one).should be_true}
  it{@a.methods.include?(:new_one).should be_true}
  it{@a.methods.include?(:find_index).should be_true}
  it{@a.methods.include?(:index).should be_true}
  it{@a.methods.include?(:show).should be_true}
  it{@a.methods.include?(:new).should be_true}
  it{@a.methods.include?(:edit).should be_true}
  it{@a.methods.include?(:create).should be_true}
  it{@a.methods.include?(:update).should be_true}
  it{@a.methods.include?(:destroy).should be_true}
  it{@a.methods.include?(:respond_index).should be_true}
  it{@a.methods.include?(:respond_show).should be_true}
  it{@a.methods.include?(:respond_create).should be_true}
  it{@a.methods.include?(:respond_update).should be_true}
  it{@a.methods.include?(:respond_destroy).should be_true}
end
