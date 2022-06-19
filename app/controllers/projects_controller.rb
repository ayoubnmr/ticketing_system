class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects= Project.all
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end  
  
  
  def new
    @project = current_user.projects.new
  end  
  
  def edit
    @project = current_user.projects.find(params[:id])
  end
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      @project.user_id = current_user.id
      ProjectmailerMailer.project_created(User.last).deliver_now
      redirect_to  projects_path(@project), notice: 'Project was successfully created.'
    else
      render :new 
    end  
  end

  def update
      if @project.update(project_params)
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :new 
      end
  end


def destroy
    @project = Project.find(params[:id])
    @project.destroy
       redirect_to projects_url, notice: 'Project was successfully destroyed.'
end
private
  

  def project_params
     params.require(:project).permit(:project_id, :name , :title , :start , :end )
  end  

 
  
end 
