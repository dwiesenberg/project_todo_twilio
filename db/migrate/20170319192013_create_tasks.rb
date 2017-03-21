class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string  :name  
      t.text    :description
      t.float   :man_hours
      t.integer :resources
      t.date    :completion_date

      t.timestamps
    end
  end
end
