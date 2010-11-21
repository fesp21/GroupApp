require 'spec_helper'

describe "/newsfeeds/show.html.erb" do
  include NewsfeedsHelper
  before(:each) do
    assigns[:newsfeed] = @newsfeed = stub_model(Newsfeed,
      :descriptions => "value for descriptions"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ descriptions/)
  end
end
