require 'spec_helper'

describe "/newsfeeds/index.html.erb" do
  include NewsfeedsHelper

  before(:each) do
    assigns[:newsfeeds] = [
      stub_model(Newsfeed,
        :descriptions => "value for descriptions"
      ),
      stub_model(Newsfeed,
        :descriptions => "value for descriptions"
      )
    ]
  end

  it "renders a list of newsfeeds" do
    render
    response.should have_tag("tr>td", "value for descriptions".to_s, 2)
  end
end
