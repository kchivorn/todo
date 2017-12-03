class TodoItem < ApplicationRecord
  belongs_to :todo_list, touch: true
  validates :content, :deadline, presence: true

  def completed?
    completed_at.present?
  end
end
