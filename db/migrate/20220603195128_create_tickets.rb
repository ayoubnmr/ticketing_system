class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :title
      t.string :content
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
