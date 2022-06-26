class User < ApplicationRecord
  has_many :project_users
  has_many :projects, through: :project_users 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
after_create :welcome
  def welcome
    UserMailer.with(user: @user).welcome.deliver_now
  end
end
