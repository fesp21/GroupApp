class PostsController < ApplicationController
  before_filter :get_group

  # GET /posts
  # GET /posts.xml
  def index
    @posts = @group.posts
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = @group.posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = @group.posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = @group.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = @group.posts.build(params[:post])
  	@post.user = current_user.username
  	@post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        Newsfeed.create!(:descriptions => current_user.username + ' created a new post.', :time => @post.created_at, :group_id => @group.id, :link => group_posts_path(@group))
        format.html { redirect_to([@group, @post], :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = @group.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to([@group, @post], :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = @group.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(group_posts_path(@group)) }
      format.xml  { head :ok }
    end
  end
  
  private
	def get_group
	  @group=Group.find(params[:group_id])
	end
end
