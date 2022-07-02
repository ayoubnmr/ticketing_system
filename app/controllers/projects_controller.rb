class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin
      @projects = Project.all
    else
      @project_owner = Project.where(:user_id => current_user.id)
      @project_adds  = current_user.projects
      @projects = (@project_owner + @project_adds)
    end
      @project = Project.new
  end
  def show
    if current_user.admin
      @project = Project.find(params[:id])
    elsif (@project.user_id == current_user.id)
      @project = Project.where(:user_id => current_user.id).find(params[:id])
    else  
      @project = current_user.projects.find(params[:id])
    end
  end  
  def new
    @project = current_user.projects.new
  end    

  def edit
    if current_user.admin
      @project = Project.find(params[:id])
    elsif 
      (@project.user_id == current_user.id)
      @project = Project.where(:user_id => current_user.id).find(params[:id])
    else  
      @project = current_user.projects.find(params[:id])
    end
  end
  def create
    @project = current_user.projects.new(project_params)
    @project.user_id = current_user.id
    if @project.save
        redirect_to  projects_path(@project), notice: 'Project was successfully created.'
    else
        redirect_to new_project_path status: :unprocessable_entity
    end  
  end
  def update
    if current_user.admin
      if @project.update(project_params)
        redirect_to projects_path(@project), notice: 'Project was successfully updated.'
      else
        redirect_to new_project_path status: :unprocessable_entity
      end
    elsif  
      (@project.user_id == current_user.id)
      @project = Project.where(:user_id => current_user.id).find(params[:id])
      if @project.update(project_params)
        redirect_to projects_path(@project), notice: 'Project was successfully updated.'
      else
        redirect_to new_project_path status: :unprocessable_entity
      end
    else  
      @project = current_user.projects.find(params[:id])    
      if @project.update(project_params)
        redirect_to projects_path(@project), notice: 'Project was successfully updated.'
      else
        redirect_to new_project_path status: :unprocessable_entity
      end
    end
  end 
  def destroy
    if current_user.admin
      @project = Project.find(params[:id])
      @project.destroy
    elsif
      (@project.user_id == current_user.id)
      @project = Project.where(:user_id => current_user.id).find(params[:id])
      @project.destroy
    else
      @project = current_user.projects.find(params[:id])
      @project.destroy
    end  
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end
private
  
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:project_id, :name , :title , :start , :end , user_ids:[])
  end    
end 
