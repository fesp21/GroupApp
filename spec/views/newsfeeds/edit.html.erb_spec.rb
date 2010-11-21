require 'spec_helper'

describe "/newsfeeds/edit.html.erb" do
  include NewsfeedsHelper

  before(:each) do
    assigns[:newsfeed] = @newsfeed = stub_model(Newsfeed,
      :new_record? => false,
      :descriptions => "value for descriptions"
    )
  end

  it "renders the edit newsfeed form" do
    render

    response.should have_tag("form[action=#{newsfeed_path(@newsfeed)}][method=post]") do
      with_tag('textarea#newsfeed_descriptions[name=?]', "newsfeed[descriptions]")
    end
  end
end
