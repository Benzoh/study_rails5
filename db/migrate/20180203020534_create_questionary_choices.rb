class CreateQuestionaryChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :questionary_choices do |t|

      t.timestamps
    end
  end
end
