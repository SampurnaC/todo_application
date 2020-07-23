class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.html {redirect_to root_path}
      end
    end
  end

  def update
    @todo = Todo.find(params[:id])
    respond_to do |format|
      if @todo.update(todo_params)
        format.html {redirect_to root_path}
      end
    end    
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      respond_to do |format|
        format.html {redirect_to root_path}
      end
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :completed)
  end
end
