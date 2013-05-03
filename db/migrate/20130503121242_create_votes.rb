class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :choice
      t.references :survey
    end
    # add_index :votes, [:user_id, :choice_id]
  end
end
