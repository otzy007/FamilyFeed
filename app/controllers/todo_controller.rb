class TodoController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @new = Todo.where status: 'new', family_id: current_user.family.id
     @done = Todo.where status: 'done', family_id: current_user.family.id
  end

  def new
  end

  def create
#      post = params[:todo][:text]
     begin
	post = params.require(:todo).require(:text)
     rescue ActionController::ParameterMissing
	redirect_to :todo_index, :alert => 'You should input some text'
	return
     end
	   
     todo = current_user.todos.create :text => post, :family => current_user.family, :status => 'new'
     current_user.posts.create :text => "<div class='icon-tasks'></div>&nbsp;<small>#{current_user.name} added <b>#{post}</b> to the <a href='/todo'>TODO list</a></small>", 
	   :family => current_user.family, :todo => todo
     
     redirect_to :todo_index
  end

  def update
     todo = Todo.find_by_id_and_family_id params.require(:id), current_user.family.id 
     oldstatus = todo.status
     
     if oldstatus == 'new'
	todo.update_attribute :status, 'done'
	current_user.posts.create :text => "<div class='icon-check'></div>&nbsp;<small>#{current_user.name} finished <b>#{todo.text}</b> from the <a href='/todo'>TODO list</a></small>",
	      :family => current_user.family
     elsif oldstatus == 'done'
	todo.update_attribute :status, 'new'
	current_user.posts.create :text => "<div class='icon-check-empty'></div>&nbsp;<small>#{current_user.name} reopened <b>#{todo.text}</b> on the <a href='/todo'>TODO list</a></small>",
	      :family => current_user.family
     end
     
     redirect_to :todo_index
  end
  
  def destroy
     Todo.find_by_id_and_family_id(params.require(:id), current_user.family.id).destroy
     
     redirect_to :todo_index
  end
end
