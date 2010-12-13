class UsersController < ApplicationController

  def search
    @users = User.search params[:search]
    redirect_to group_users_path(Group.find(params[:group_id]))
  end
  
  # GET /users
  # GET /users.xml
  def index
	  @group= Group.find(params[:group_id])
	  @membership = Membership.find_by_user_id_and_group_id(current_user.id, @group.id)
	  if @membership.permission==0 && @membership.established
      @admin = true
    else
      @admin = false
    end
  end
  
  def user_manage
    @users = User.find(:all, :order => :username)

    respond_to do |format|
      format.html # user_manage.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  def search
    @users = User.search params[:search]
  end
  
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.username} was successfully created."
        format.html { redirect_to(root_url) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.username} was successfully updated."
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
	  if current_user.id==@user.id
		  redirect_to(logout_path)
		  @user.destroy
	  else
	    @user.destroy
		  respond_to do |format|
		    format.html { redirect_to(:action => 'user_manage') }
		    format.xml  { head :ok }
		  end
	  end
  end
end
