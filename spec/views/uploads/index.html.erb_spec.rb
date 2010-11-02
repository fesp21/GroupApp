require 'spec_helper'

describe "/uploads/index.html.erb" do
  include UploadsHelper

  before(:each) do
    assigns[:uploads] = [
      stub_model(Upload),
      stub_model(Upload)
    ]
  end

  it "renders a list of uploads" do
    render
  end
end
