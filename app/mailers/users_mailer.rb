class UsersMailer < ApplicationMailer
  def inform_todolist(user_id, todo_list_id, todo_list_title, todo_list_description, todo_item_content=nil, action=nil)
    @user = User.find(user_id)
    @todo_list_id = todo_list_id
    @todo_list_title = todo_list_title
    @todo_list_description = todo_list_description
    @todo_item_content = todo_item_content
    @action = action == 'destroy' ? 'delete' : action
    puts "mail is sending now ..."
    mail( to: ENV['EMAIL_RECIPIENT'],
      from: @user.email,
      subject: subject(@todo_item_content, @todo_list_title)
    )
  end

  private

  def subject(todo_item_content, todo_list_title)
    str = "Successfully #{@action.capitalize}d "
    if todo_item_content
      str += "item: #{todo_item_content} in todo list: #{todo_list_title}"
    else
      str += "#{@todo_list_title}"
    end
    str
  end
end
