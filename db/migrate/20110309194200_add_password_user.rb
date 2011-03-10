class AddPasswordUser < ActiveRecord::Migration
  def self.up
    add_column User.table_name, :password, :string
    add_column User.table_name, :salt, :string
  end

  def self.down
    remove_column User.table_name, :password, :string
    remove_column User.table_name, :salt
  end
end
