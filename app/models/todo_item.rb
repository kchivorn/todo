class TodoItem < ApplicationRecord
  belongs_to :todo_list
  validates :content, presence: true
  validates :deadline, presence: true

  def completed?
    completed_at.present?
  end
end
