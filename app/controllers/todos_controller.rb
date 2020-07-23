class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.html {redirect_to root_path}
      end
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :completed)
  end
end
