class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  # self.page_cache_directory = -> { Rails.root.join("public/caches_page", request.domain) }
  #caches_page :index

  def index
    @todo_lists = TodoList.all
  end

  def show
    @todo_items = @todo_list.todo_items.order('deadline')
    # @todo_items = Rails.cache.fetch(@todo_list.id) {
    #   @todo_list.todo_items.order('deadline')
    # }
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)

    if @todo_list.save
      UsersMailer.inform_todolist(current_user.id, @todo_list.id).deliver_now
      redirect_to @todo_list, notice: 'Todo list was successfully created.'
    else
      render :new
    end
  end

  def update
      if @todo_list.update(todo_list_params)
        #expire_page action: "show", id: params[:id]
        redirect_to @todo_list, notice: 'Todo list was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
