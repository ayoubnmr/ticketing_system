# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  end        :date
#  name       :string
#  start      :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Project < ApplicationRecord
    has_many :tickets , dependent: :destroy
    has_many :project_users 
    has_many :users, through: :project_users , dependent: :destroy 




end
