class UsersMailer < ApplicationMailer
  def inform_todolist(user_id, todo_list_id, todo_list_title, todo_list_description, action=nil)
    @user = User.find(user_id)
    @todo_list_id = todo_list_id
    @todo_list_title = todo_list_title
    @todo_list_description = todo_list_description
    @action = action == 'destroy' ? 'delete' : action
    puts "mail is sending now ..."
    mail( to: ENV['EMAIL_RECIPIENT'],
      from: @user.email,
      subject: "Successfully #{@action.capitalize}d #{@todo_list_title}"
    )
  end
end
