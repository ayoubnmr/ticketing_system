class ProjectUsersController < ApplicationController

   def index
     @project_users = ProjectUser.all
   end
   
   def show 
    binding.pry
    #   @project_user = ProjectUser.find(current_user.id)
   end
end