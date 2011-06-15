class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :priority
      t.integer :assigned_to
      t.string :logged_time
      t.integer :created_by
      t.string :tracker
      t.integer :project_id

      t.timestamps
    end
    
    add_index :tickets, :name
    add_index :tickets, :status
    add_index :tickets, :priority
    add_index :tickets, :created_at
    add_index :tickets, :assigned_to
    add_index :tickets, :project_id
  end

  def self.down
    drop_table :tickets
  end
end
