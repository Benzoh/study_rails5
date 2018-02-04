class CreateManagerSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_schedules do |t|

      t.timestamps
    end
  end
end
