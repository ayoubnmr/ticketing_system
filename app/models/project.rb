class Project < ApplicationRecord
    has_many :tickets , dependent: :destroy
    has_many :project_users 
    has_many :users, through: :project_users , dependent: :destroy 
end
