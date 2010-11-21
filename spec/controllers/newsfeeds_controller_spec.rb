require 'spec_helper'

describe NewsfeedsController do

  def mock_newsfeed(stubs={})
    @mock_newsfeed ||= mock_model(Newsfeed, stubs)
  end

  describe "GET index" do
    it "assigns all newsfeeds as @newsfeeds" do
      Newsfeed.stub(:find).with(:all).and_return([mock_newsfeed])
      get :index
      assigns[:newsfeeds].should == [mock_newsfeed]
    end
  end

  describe "GET show" do
    it "assigns the requested newsfeed as @newsfeed" do
      Newsfeed.stub(:find).with("37").and_return(mock_newsfeed)
      get :show, :id => "37"
      assigns[:newsfeed].should equal(mock_newsfeed)
    end
  end

  describe "GET new" do
    it "assigns a new newsfeed as @newsfeed" do
      Newsfeed.stub(:new).and_return(mock_newsfeed)
      get :new
      assigns[:newsfeed].should equal(mock_newsfeed)
    end
  end

  describe "GET edit" do
    it "assigns the requested newsfeed as @newsfeed" do
      Newsfeed.stub(:find).with("37").and_return(mock_newsfeed)
      get :edit, :id => "37"
      assigns[:newsfeed].should equal(mock_newsfeed)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created newsfeed as @newsfeed" do
        Newsfeed.stub(:new).with({'these' => 'params'}).and_return(mock_newsfeed(:save => true))
        post :create, :newsfeed => {:these => 'params'}
        assigns[:newsfeed].should equal(mock_newsfeed)
      end

      it "redirects to the created newsfeed" do
        Newsfeed.stub(:new).and_return(mock_newsfeed(:save => true))
        post :create, :newsfeed => {}
        response.should redirect_to(newsfeed_url(mock_newsfeed))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved newsfeed as @newsfeed" do
        Newsfeed.stub(:new).with({'these' => 'params'}).and_return(mock_newsfeed(:save => false))
        post :create, :newsfeed => {:these => 'params'}
        assigns[:newsfeed].should equal(mock_newsfeed)
      end

      it "re-renders the 'new' template" do
        Newsfeed.stub(:new).and_return(mock_newsfeed(:save => false))
        post :create, :newsfeed => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested newsfeed" do
        Newsfeed.should_receive(:find).with("37").and_return(mock_newsfeed)
        mock_newsfeed.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :newsfeed => {:these => 'params'}
      end

      it "assigns the requested newsfeed as @newsfeed" do
        Newsfeed.stub(:find).and_return(mock_newsfeed(:update_attributes => true))
        put :update, :id => "1"
        assigns[:newsfeed].should equal(mock_newsfeed)
      end

      it "redirects to the newsfeed" do
        Newsfeed.stub(:find).and_return(mock_newsfeed(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(newsfeed_url(mock_newsfeed))
      end
    end

    describe "with invalid params" do
      it "updates the requested newsfeed" do
        Newsfeed.should_receive(:find).with("37").and_return(mock_newsfeed)
        mock_newsfeed.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :newsfeed => {:these => 'params'}
      end

      it "assigns the newsfeed as @newsfeed" do
        Newsfeed.stub(:find).and_return(mock_newsfeed(:update_attributes => false))
        put :update, :id => "1"
        assigns[:newsfeed].should equal(mock_newsfeed)
      end

      it "re-renders the 'edit' template" do
        Newsfeed.stub(:find).and_return(mock_newsfeed(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested newsfeed" do
      Newsfeed.should_receive(:find).with("37").and_return(mock_newsfeed)
      mock_newsfeed.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the newsfeeds list" do
      Newsfeed.stub(:find).and_return(mock_newsfeed(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(newsfeeds_url)
    end
  end

end
