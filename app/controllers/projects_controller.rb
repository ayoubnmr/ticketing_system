class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.admin
      @projects = Project.all
    else
      @projects = current_user.projects
    end
      @project = Project.new
  end
  def show
    @project = current_user.projects.find(params[:id])
  end  
  def new
    @project = current_user.projects.new
  end  
  def edit
    @project = current_user.projects.find(params[:id])
  end
  def create
    @project = current_user.projects.new(project_params)
    @project.user_id = current_user.id
    if @project.save
        redirect_to  projects_path(@project), notice: 'Project was successfully created.'
    else
        redirect_to new_project_path 
    end  
  end
  def update
      @project = current_user.projects.find(params[:id])    
      if @project.update(project_params)
        redirect_to projects_path(@project), notice: 'Project was successfully updated.'
      else
        redirect_to new_project_path 
      end
  end
  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end
private
  def project_params
     params.require(:project).permit(:project_id, :name , :title , :start , :end , user_ids:[])
  end    
end 
