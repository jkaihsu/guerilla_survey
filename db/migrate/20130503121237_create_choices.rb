class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :text
      t.references :question
      t.timestamps
    end
    add_index :choices, [:question_id]
  end
end
