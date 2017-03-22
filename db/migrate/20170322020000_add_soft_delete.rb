class AddSoftDelete < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :deleted, :boolean, default: true
  end
end
