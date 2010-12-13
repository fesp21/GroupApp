class UploadsController < ApplicationController
  before_filter :get_group
  
  # GET /uploads
  # GET /uploads.xml
  def index
    @uploads = @group.uploads
	  if !@group.users.member?(current_user)
		  redirect_to(:controller => 'users', :action => 'login')
	  else
		  respond_to do |format|
		    format.html # index.html.erb
		    format.xml  { render :xml => @uploads }
		  end
	  end
  end

  # GET /uploads/1
  # GET /uploads/1.xml
  def show
    @upload = @group.uploads.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.xml
  def new
    @upload = @group.uploads.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = @group.uploads.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.xml
  def create
    @upload = @group.uploads.build(params[:upload])
    @upload.user_id = current_user.id

    respond_to do |format|
      if @upload.save
        Newsfeed.create!(:descriptions => current_user.username + ' uploaded a new file', :time => @upload.created_at, :group_id => @group.id, :link => group_uploads_path(@group))
        format.html { redirect_to(group_uploads_path(@group)) }
        format.xml  { render :xml => @upload, :status => :created, :location => @upload }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.xml
  def update
    @upload = @group.uploads.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to(group_uploads_path(@group)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.xml
  def destroy
    @upload = @group.uploads.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to(group_uploads_path(@group)) }
      format.xml  { head :ok }
    end
  end
  
  private
	def get_group
	  @group=Group.find(params[:group_id])
	end
end
