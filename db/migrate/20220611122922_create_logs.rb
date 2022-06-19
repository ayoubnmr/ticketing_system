class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.integer :ticket_id
      t.text :message
      t.timestamps
    end
  end
end
