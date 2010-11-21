class NewsfeedsController < ApplicationController
  before_filter :get_group
  
  # GET /newsfeeds
  # GET /newsfeeds.xml
  def index
    @newsfeeds = Newsfeed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsfeeds }
    end
  end

  # GET /newsfeeds/1
  # GET /newsfeeds/1.xml
  def show
    @newsfeed = Newsfeed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsfeed }
    end
  end

  # GET /newsfeeds/new
  # GET /newsfeeds/new.xml
  def new
    @newsfeed = Newsfeed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsfeed }
    end
  end

  # GET /newsfeeds/1/edit
  def edit
    @newsfeed = Newsfeed.find(params[:id])
  end

  # POST /newsfeeds
  # POST /newsfeeds.xml
  def create
    @newsfeed = Newsfeed.new(params[:newsfeed])

    respond_to do |format|
      if @newsfeed.save
        format.html { redirect_to(@newsfeed, :notice => 'Newsfeed was successfully created.') }
        format.xml  { render :xml => @newsfeed, :status => :created, :location => @newsfeed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsfeed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsfeeds/1
  # PUT /newsfeeds/1.xml
  def update
    @newsfeed = Newsfeed.find(params[:id])

    respond_to do |format|
      if @newsfeed.update_attributes(params[:newsfeed])
        format.html { redirect_to([@group, @newsfeed], :notice => 'Newsfeed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsfeed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsfeeds/1
  # DELETE /newsfeeds/1.xml
  def destroy
    @newsfeed = Newsfeed.find(params[:id])
    @newsfeed.destroy

    respond_to do |format|
      format.html { redirect_to(group_path(@group)) }
      format.xml  { head :ok }
    end
  end
  
  private
	def get_group
	  @group=Group.find(params[:group_id])
	end
end
