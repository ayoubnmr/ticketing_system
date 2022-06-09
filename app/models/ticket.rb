# == Schema Information
#
# Table name: tickets
#
#  id         :bigint           not null, primary key
#  content    :string
#  name       :string
#  status     :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_tickets_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Ticket < ApplicationRecord
  belongs_to :project
  enum status: {
    ToDo: 0,
    InProgress: 1,
    Done: 2
  }
  has_one_attached :avatar
  
end
