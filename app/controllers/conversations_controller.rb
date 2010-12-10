class ConversationsController < ApplicationController
  require 'sms_fu'
  before_filter :get_group
  
  def send_text
    @conversation = Conversation.new(params[:conversation])
    @conversation.origin = current_user.username
    sms_fu = SMSFu::Client.configure(:delivery => :pony,:pony_config => { :via => :sendmail })
    @user_target = User.find_by_username(@conversation.target)
    sms_fu.deliver(@user_target.phone_number,@user_target.phone_carrier,@conversation.message)
    redirect_to(current_user)
  end
  
  # GET /conversations
  # GET /conversations.xml
  def index
    @conversations = @group.conversations

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.xml
  def show
    @conversation = @group.conversations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.xml
  def new
    @conversation = @group.conversations.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conversation }
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.xml
  def create
    @conversation = @group.conversations.build(params[:conversation])
    @conversation.origin = current_user.username
    @conversation.group_id = @group.id
    sms_fu = SMSFu::Client.configure(:delivery => :pony,:pony_config => { :via => :sendmail })
    @user_target = User.find_by_username(@conversation.target)
    if @user_target.allow_text && @conversation.also_text
      sms_fu.deliver(@user_target.phone_number,@user_target.phone_carrier,@conversation.message)
    end
    respond_to do |format|
      if @conversation.save
        format.html { redirect_to(group_path(@group)) }
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.xml
  def update
    @conversation = @group.conversations.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to(group_path(@group)) }
        format.xml  { head :ok }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.xml
  def destroy
    @conversation = @group.conversations.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to(group_path(@group)) }
    end
  end
  
  private
	def get_group
	  @group=Group.find(params[:group_id])
	end
end
