require 'spec_helper'

describe "/uploads/edit.html.erb" do
  include UploadsHelper

  before(:each) do
    assigns[:upload] = @upload = stub_model(Upload,
      :new_record? => false
    )
  end


end
