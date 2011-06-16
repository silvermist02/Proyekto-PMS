class CreateTicketsTagsLinkTable < ActiveRecord::Migration
  def self.up
    create_table :tickets_tags, :id => false do |t|
      t.references :ticket, :tag
    end
    
      add_index :tickets_tags, :ticket_id
      add_index :tickets_tags, :tag_id
  end

  def self.down
    drop_table :tickets_tags
  end
end
