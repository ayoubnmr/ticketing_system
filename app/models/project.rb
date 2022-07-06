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
    scope :by_users, lambda {|current_user|(left_joins(:project_users).where(project_users: {user_id: current_user}))
                        .or(left_joins(:project_users).where(projects: {user_id: current_user})).distinct}
end
