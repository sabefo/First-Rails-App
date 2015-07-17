class User < ActiveRecord::Base

  validates :username, uniqueness: true
  has_secure_password
  has_many :questions, foreign_key: "author_id"
  has_many :answers, through: :questions
  has_many :responses, class_name: "Answer", foreign_key: "respond_id"

end
