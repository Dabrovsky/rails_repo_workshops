class Task < ApplicationRecord
  validates :title, presence: true
  validates :deadline, presence: true

  scope :by_deadline, -> { order(deadline: :asc) }

  def formatted_deadline
    deadline.strftime("%d-%m-%Y")
  end
end
