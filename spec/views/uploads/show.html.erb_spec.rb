require 'spec_helper'

describe "/uploads/show.html.erb" do
  include UploadsHelper
  before(:each) do
    assigns[:upload] = @upload = stub_model(Upload)
  end


end
