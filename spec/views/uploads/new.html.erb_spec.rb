require 'spec_helper'

describe "/uploads/new.html.erb" do
  include UploadsHelper

  before(:each) do
    assigns[:upload] = stub_model(Upload,
      :new_record? => true
    )
  end

  it "renders new upload form" do
    render

    response.should have_tag("form[action=?][method=post]", uploads_path) do
    end
  end
end
