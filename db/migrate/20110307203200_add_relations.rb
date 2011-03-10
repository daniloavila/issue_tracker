class AddRelations < ActiveRecord::Migration
  def self.up
    add_column Issue.table_name, :user_id, :integer
    add_column Issue.table_name, :project_id, :integer
    add_column Project.table_name, :user_id, :integer
  end

  def self.down
    remove_column Issue.table_name, :user_id
    remove_column Issue.table_name, :project_id
    remove_column Project.table_name, :user_id
  end
end