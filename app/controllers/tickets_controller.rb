class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i(show edit update destroy)

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end  

  def edit
    @ticket = Tickets.edit(ticket_params)
  end

  # def new 
  #   @ticket = @project.tickets.new
  # end 

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
    @ticket = Ticket.edit
    if @ticket.update
      redirect_to ticket_path(@ticket), notice: 'Ticket was successfully created.'
    else
      render :new 
    end 
  end 
  
  def destroy
    @ticket.destroy
    redirect_to project_ticket_path, notice: 'Ticket was successfully created.'
  end 
private  

def set_project
  @project = Project.find(params[:project_id])
end

def set_ticket
  @ticket = @project.tickets.find(params[:id])
end

  def ticket_params
    params.permit(:name, :title, :content)
  end  

end   