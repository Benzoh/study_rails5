class CreateQuestionaryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :questionary_items do |t|

      t.timestamps
    end
  end
end
