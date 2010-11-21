require 'spec_helper'

describe NewsfeedsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/newsfeeds" }.should route_to(:controller => "newsfeeds", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/newsfeeds/new" }.should route_to(:controller => "newsfeeds", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/newsfeeds/1" }.should route_to(:controller => "newsfeeds", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/newsfeeds/1/edit" }.should route_to(:controller => "newsfeeds", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/newsfeeds" }.should route_to(:controller => "newsfeeds", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/newsfeeds/1" }.should route_to(:controller => "newsfeeds", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/newsfeeds/1" }.should route_to(:controller => "newsfeeds", :action => "destroy", :id => "1") 
    end
  end
end
