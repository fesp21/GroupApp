class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    @user = User.find(session[:user_id])
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @user = User.find(session[:user_id])
    @group = Group.find(params[:id])
	if !@group.users.member?(User.find(session[:user_id]))
		redirect_to(groups_url)
	else
		respond_to do |format|
		  format.html # show.html.erb
		  format.xml  { render :xml => @group }
		end
	end
  end

  def join
    Membership.create!(:user_id => session[:user_id], :group_id => params[:id])
    redirect_to(groups_url)
  end
  
  def unjoin
    Membership.destroy(Membership.find_by_user_id_and_group_id(session[:user_id], params[:id]))
    redirect_to(groups_url)
  end
  
  # GET /groups/new
  # GET /groups/new.xml
  def new
    @user = User.find(session[:user_id])
    @group = Group.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @user = User.find(session[:user_id])
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group, :notice => 'Group was successfully created.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'Group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
