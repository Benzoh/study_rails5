class CreateDesignerSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :designer_schedules do |t|

      t.timestamps
    end
  end
end
