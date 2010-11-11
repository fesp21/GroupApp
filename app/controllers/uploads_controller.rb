class UploadsController < ApplicationController
  before_filter :get_group
  
  # GET /uploads
  # GET /uploads.xml
  def index
    @user = User.find(session[:user_id])
    @uploads = @group.uploads

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.xml
  def show
    @user = User.find(session[:user_id])
    @upload = @group.uploads.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.xml
  def new
    @user = User.find(session[:user_id])
    @upload = @group.uploads.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @user = User.find(session[:user_id])
    @upload = @group.uploads.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.xml
  def create
    @upload = @group.uploads.build(params[:upload])

    respond_to do |format|
      if @upload.save
        format.html { redirect_to([@group, @upload], :notice => 'Upload was successfully created.') }
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
        format.html { redirect_to([@group, @upload], :notice => 'Upload was successfully updated.') }
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
