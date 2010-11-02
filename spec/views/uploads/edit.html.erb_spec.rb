require 'spec_helper'

describe "/uploads/edit.html.erb" do
  include UploadsHelper

  before(:each) do
    assigns[:upload] = @upload = stub_model(Upload,
      :new_record? => false
    )
  end

  it "renders the edit upload form" do
    render

    response.should have_tag("form[action=#{upload_path(@upload)}][method=post]") do
    end
  end
end
