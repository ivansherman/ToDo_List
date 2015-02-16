class TodosController < ApplicationController\
  ##helper_method :current_filter


  def index
    @todos = Todo
  end

  def active
    @todos = Todo.active
    set_current_filter(:active)
    render :index
  end

  def completed
    @todos = Todo.completed
    set_current_filter(:completed)
    render :index
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
  end


  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  def destroy_completed
    @todos_for_destruction = Todo.completed.all
    
    Todo.completed.destroy_all
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.toggle!(:completed)
  end

  def toggle_all
    Todo.update_all(completed: params[:completed] ? 't' : 'f')
    @todos = Todo.all
  end

private ## -------------------------------------
  
  def set_current_filter(filter)
    @current_filter = filter
  end

  def current_filter
    @current_filter
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
=begin
 def set_filter
    path = request.referer
    return unless path.present?
    params[:active] = true if path.end_with?(active_todos_path)
    params[:completed] = true if path.end_with?(completed_todos_path)
  end

  def set_todos
    if params[:active]
      @todos = Todo.active
    elsif params[:completed] 
      @todos = Todo.completed
    else
      Todo.all
    end
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
=end
  


