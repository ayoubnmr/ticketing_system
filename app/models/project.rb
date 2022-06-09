# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  end        :date
#  name       :string
#  start      :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
    has_many :tickets , dependent: :destroy
    has_many :project_users 
    has_many :users, through: :project_users , dependent: :destroy 
end
