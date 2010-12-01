class MembershipsController < ApplicationController
  
  def makeAdmin
    @group = Group.find(params[:group_id])
    @membership = Membership.find(params[:id])
    @membership.permission = 0
    @membership.save
    redirect_to(group_users_path(@group))
  end

  def unmakeAdmin
    @group = Group.find(params[:group_id])
    @membership = Membership.find(params[:id])
    @membership.permission = 1
    @membership.save
    redirect_to(group_users_path(@group))
  end
  
  def confirm
    @group = Group.find(params[:group_id])
    @membership = Membership.find(params[:id])
    @membership.request = false
    @membership.invitation = false
    @membership.established = true
    @membership.save
    redirect_to(group_users_path(@group))
  end
  
  # GET /memberships
  # GET /memberships.xml
  def index
    @memberships = Membership.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.xml
  def show
    @membership = Membership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @membership }
    end
  end

  # GET /memberships/new
  # GET /memberships/new.xml
  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @membership }
    end
  end

  # GET /memberships/1/edit
  def edit
    @membership = Membership.find(params[:id])
  end

  # POST /memberships
  # POST /memberships.xml
  def create
    @membership = Membership.new(params[:membership])
    respond_to do |format|
      if @membership.save
        Newsfeed.create!(:descriptions => User.find(@membership.user_id).name + ' has joined the group.', :time => @membership.created_at, :group_id => @membership.group_id, :link => group_users_path(@membership.group_id))
        format.html { redirect_to(@membership, :notice => 'Membership was successfully created.') }
        format.xml  { render :xml => @membership, :status => :created, :location => @membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.xml
  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        format.html { redirect_to(@membership, :notice => 'Membership was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.xml
  def destroy
    @group=Group.find(params[:group_id])
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to(group_users_path(@group)) }
      format.xml  { head :ok }
    end
  end
end
