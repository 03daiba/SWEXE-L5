class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :messeage
      t.datetime :tdate
      t.integer :user_id
      t.timestamps
    end
  end
end
