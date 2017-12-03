class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create todo_item_params
    redirect_to @todo_list
  end

  def complete
    @todo_item.update_attributes(completed_at: Time.now)
  end

  def uncomplete
    @todo_item.update_attributes(completed_at: nil)
  end

  def edit
  end

  def update
    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Todo item was updated successfully."
    else
      flash[:error] = "Todo item could not be updated."
    end
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo list item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @todo_list
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit(:content, :deadline)
  end
end
