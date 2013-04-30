class TodoController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @new = Todo.find_all_by_status 'new'
     @done = Todo.find_all_by_status 'done'
  end

  def new
  end

  def create
     post = params[:todo][:text]
     p post
     current_user.todos.create :text => post, :family => current_user.family, :status => 'new'
      
     redirect_to :todo_index
  end

  def update
     todo = Todo.find_by_id params[:id]
     oldstatus = todo.status
     
     if oldstatus == 'new'
	todo.update_attribute :status, 'done'
     elsif oldstatus == 'done'
	todo.update_attribute :status, 'new'
     end
     
     redirect_to :todo_index
  end
  
  def destroy
     Todo.find_by_id(params[:id]).destroy
     
     redirect_to :todo_index
  end
end
