class List < ApplicationRecord
  has_many :tasks

  def self.search(search)
    if search
      List.where(['title LIKE ?',"%#{search}%"])
    else
      List.all
    end
  end


  validates :title,
    presence: true,
    length: {maximum: 31, message:"ToDoリストの名称は30文字以内にしてください"},
    uniqueness: true
end
