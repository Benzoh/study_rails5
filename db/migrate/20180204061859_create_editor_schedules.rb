class CreateEditorSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :editor_schedules do |t|

      t.timestamps
    end
  end
end
