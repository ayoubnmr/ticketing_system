class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i( show update edit  destroy)

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end  

  def edit
    @ticket = @project.tickets.find(params[:id])
  end

  def new 
    @ticket = @project.tickets.new
  end 

  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.new(ticket_params) 
    if @ticket.save
      redirect_to project_path(@project), notice: 'Ticket was successfully created.'
    else
      render :new, status: :unprocessable_entity  
    end
  end 
  
  def update
    if @ticket.update(ticket_params)
      redirect_to project_path(@project), notice: 'Ticket was successfully update.'
    else
      render :new 
    end 
  end 
  
  def destroy
    @ticket.destroy
    redirect_to project_ticket_path, notice: 'Ticket was successfully deleted.'
  end 
private  

def set_project
  @project = Project.find(params[:project_id])
end

def set_ticket
  
  @ticket = @project.tickets.find(params[:id])
end

  def ticket_params
    params.require(:ticket).permit(:name, :title, :content)
  end  

end   