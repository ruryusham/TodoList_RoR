class Task < ApplicationRecord
  belongs_to :list

  def self.search(search)
    if search
      Task.where(['title LIKE ?',"%#{search}%"])
    else
      Task.all
    end
  end

  validates :title,
    presence: true,
    uniqueness: true,
    length: {maximum: 31, message:"ToDoリストの名称は30文字以内にしてください"}


  scope :finished, -> {where(done: true)}
end
