class ChangeSoftDelete < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :deleted, :boolean, default: false
  end
end
