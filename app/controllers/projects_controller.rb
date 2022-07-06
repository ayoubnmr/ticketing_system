class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin
      @projects = Project.all
    # else
    #   @project_owner = Project.where(:user_id => current_user.id)
    #   @project_adds  = current_user.projects
    #   @projects = (@project_owner + @project_adds)
    # end
    else 

    @projects = Project.by_users(current_user.id)
   
    #  @projects = Project.find_by_sql("
    #   SELECT DISTINCT projects.* FROM projects
    #   LEFT JOIN project_users ON project_users.project_id = projects.id
    #   where ( projects.user_id = #{current_user.id} OR project_users.user_id = #{current_user.id})")
    end  
      @project = Project.new
  end
  def show
    if current_user.admin
      @project = Project.find(params[:id])
    else
      @project = Project.by_users(current_user.id).find(params[:id])
    end
  end  
  def new
    @project = current_user.projects.new
  end    

  def edit
    if current_user.admin
      @project = Project.find(params[:id])
    elsif (@project.user_id == current_user.id)
      @project = Project.by_users(current_user.id).find(params[:id])
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
      end
    elsif  
      (@project.user_id == current_user.id)
      @project = Project.by_users(current_user.id).find(params[:id])
      if @project.update(project_params)
        redirect_to projects_path(@project), notice: 'Project was successfully updated.'
      else
        redirect_to new_project_path status: :unprocessable_entity
      end
    end
  end 
  def destroy
    if current_user.admin
      @project.destroy
      redirect_to root_path, notice: 'Project was successfully destroyed.'
    elsif
      (@project.user_id == current_user.id)
      @project.destroy
      redirect_to root_path, notice: 'Project was successfully destroyed.'
    end  
  end

private
  
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:project_id, :name , :title , :start , :end , user_ids:[])
  end    
end 
