class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_ticket, only: %i( show update edit  destroy)

  def index
    @tickets = Ticket.all
  end
  def show
    @ticket = tickets.find(params[:id])
  end  
  def edit
    @ticket = @project.tickets.find(params[:id])
  end
  def new 
    @ticket = @project.tickets.new
  end 
  def create
    @ticket = @project.tickets.new(ticket_params) 
    if @ticket.save
      redirect_to project_path(@project), notice: 'Ticket was successfully created.'
    else
      redirect_to new_project_path , status: :unprocessable_entity 
    end
  end 
  def update
    if @ticket.update(ticket_params)
      redirect_to project_path(@project), notice: 'Ticket was successfully update.'
    else
      redirect_to new_project_path , status: :unprocessable_entity
    end 
  end 
  def destroy
    @ticket.destroy
    redirect_to project_ticket_path, notice: 'Ticket was successfully deleted.'
  end 
private  
  def set_project
    @project = (Project.left_joins(:project_users).where(project_users: {user_id: current_user.id})
    .or(Project.left_joins(:project_users).where(projects: {user_id: current_user.id}))).distinct
    .find(params[:project_id])
  end
  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end
  def ticket_params
    params.require(:ticket).permit(:name, :title, :content, :status, :start, :end, :avatar)
  end  
end   