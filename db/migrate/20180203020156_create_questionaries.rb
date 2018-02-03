class CreateQuestionaries < ActiveRecord::Migration[5.1]
  def change
    create_table :questionaries do |t|

      t.timestamps
    end
  end
end
