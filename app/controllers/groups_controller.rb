class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])
    @member = Membership.find_by_user_id_and_group_id(current_user.id, @group.id)
	  if !@group.users.member?(current_user)
  		redirect_to(groups_url)
  	else
  		respond_to do |format|
  		  format.html # show.html.erb
  		  format.xml  { render :xml => @group }
  	  end
	  end
  end
  
  def search
    @groups = Group.search params[:search]
  end

  def join
    @membership = Membership.create!(:user_id => current_user.id, :group_id => params[:id], :permission => "1", :established => true)
	@group = Group.find(params[:id])
    Newsfeed.create!(:descriptions => current_user.username + ' has joined the group.', :time => @membership.created_at, :group_id => @membership.group_id, :link => group_users_path(@membership.group_id))
    redirect_to(@group)
  end
  
  def unjoin
    @membership = Membership.find_by_user_id_and_group_id(current_user.id, params[:id])
    Newsfeed.create!(:descriptions => current_user.username + ' has left the group.', :time => Time.now, :group_id => @membership.group_id, :link => group_users_path(@membership.group_id))
    Membership.destroy(@membership)
    redirect_to(groups_url)
  end
  
  def joinrequest
    @membership = Membership.create!(:user_id => current_user.id, :group_id => params[:id], :permission => "1", :request => true)
    redirect_to(groups_url)
  end
  
  def removerequest
    @membership = Membership.destroy(Membership.find_by_user_id_and_group_id(current_user.id, params[:id]))
    redirect_to(groups_url)
  end
  
  def invite
    @membership = Membership.create!(:user_id => params[:id_2], :group_id => params[:id], :permission => "1", :invite => true)
    redirect_to(group_users_path(Group.find(params[:id])))
  end
  
  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])
    @group.conference = Conference.create!(:group_id => @group.id)
    respond_to do |format|
      if @group.save
        Membership.create!(:user_id => current_user.id, :group_id => @group.id, :permission => "0", :established => true)
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
