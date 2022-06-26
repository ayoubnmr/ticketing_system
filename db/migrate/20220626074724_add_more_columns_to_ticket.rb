class AddMoreColumnsToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :start, :date
    add_column :tickets, :end, :date
  end
end
