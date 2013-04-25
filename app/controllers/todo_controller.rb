class TodoController < ApplicationController
  before_filter :authenticate_user!
  
  def index
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
  end
  
  def destroy
  end
end
