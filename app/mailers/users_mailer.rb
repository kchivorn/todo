class UsersMailer < ApplicationMailer
  def inform_todolist(user_id, todo_list_id)
    @user = User.find(user_id)
    @todo_list = TodoList.find(todo_list_id)
    puts "mail is sending now ..."
    mail( to: ENV['EMAIL_RECIPIENT'],
      from: @user.email,
      subject: @todo_list.title
    )
  end
end
