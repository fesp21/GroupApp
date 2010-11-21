require 'spec_helper'

describe "/newsfeeds/new.html.erb" do
  include NewsfeedsHelper

  before(:each) do
    assigns[:newsfeed] = stub_model(Newsfeed,
      :new_record? => true,
      :descriptions => "value for descriptions"
    )
  end

  it "renders new newsfeed form" do
    render

    response.should have_tag("form[action=?][method=post]", newsfeeds_path) do
      with_tag("textarea#newsfeed_descriptions[name=?]", "newsfeed[descriptions]")
    end
  end
end
