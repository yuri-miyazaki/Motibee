class AddColumnToUser < ActiveRecord::Migration[6.1]
  add_column :users, :admin, :boolean , default: false
  def change
  end
end
