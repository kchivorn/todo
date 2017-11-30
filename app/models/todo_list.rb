class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  validates :title, :description, presence: true
  before_save :add_slug

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  def add_slug
    self.slug = to_param
  end
end
