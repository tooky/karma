class PostsMigration < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      # property :id, Integer, :serial => true
      # property :title, String, :length => 255, :nullable => false
      # property :body, Text, :nullable => false
      # property :slug, String, :length => 255, :index => true
      # property :created_at, DateTime
      # property :updated_at, DateTime
      t.string :title, :limit => 255, :null => false
      t.text :body, :null => false
      t.string :slug, :limit => 255, :null => false
      t.timestamps
    end 
  end

  def self.down
    drop_table :posts
  end
end
