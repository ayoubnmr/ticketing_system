class Project < ApplicationRecord
    has_many :tickets , dependent: :destroy
    has_many :project_users 
    has_many :users, through: :project_users , dependent: :destroy 
    
    after_save :project_created
     
    def project_created
        self.users.each do |user|
            ProjectmailerMailer.with(project: self, user: user).project_created.deliver_now
        end
    end
end
