require 'spec_helper'

describe Newsfeed do
  before(:each) do
    @valid_attributes = {
      :descriptions => "value for descriptions",
      :time => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Newsfeed.create!(@valid_attributes)
  end
end
