class TodosController < ApplicationController
  before_filter :get_group
  
  def finish
    @todo = @group.todos.find(params[:id])
    @todo.finished = true
    @todo.finished_by = current_user.id
    @todo.save
    redirect_to(group_todos_path(@group))
  end

  def unfinish
    @todo = @group.todos.find(params[:id])
    @todo.finished = false
    @todo.finished_by = nil
    @todo.save
    redirect_to(group_todos_path(@group))
  end
      
  # GET /todos
  # GET /todos.xml
  def index
    @todos = @group.todos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.xml
  def show
    @todo = @group.todos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.xml
  def new
    @todo = @group.todos.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = @group.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.xml
  def create
    @todo = @group.todos.build(params[:todo])
    @todo.user_id = current_user.id

    respond_to do |format|
      if @todo.save
        Newsfeed.create!(:descriptions => current_user.username + ' added a new item on the To-Do list.', :time => @todo.created_at, :group_id => @group.id, :link => group_todos_path(@group))
        format.html { redirect_to(group_todos_path(@group)) }
        format.xml  { render :xml => @todo, :status => :created, :location => @todo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.xml
  def update
    @todo = @group.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to(group_todos_path(@group)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.xml
  def destroy
    @todo = @group.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(group_todos_path(@group)) }
      format.xml  { head :ok }
    end
  end
  
  private
	def get_group
	  @group=Group.find(params[:group_id])
	end
end
