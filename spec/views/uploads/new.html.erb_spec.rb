require 'spec_helper'

describe "/uploads/new.html.erb" do
  include UploadsHelper

  before(:each) do
    assigns[:upload] = stub_model(Upload,
      :new_record? => true
    )
  end


end
