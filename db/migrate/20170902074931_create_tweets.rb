class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :compilation, index:true, foreign_key: true
      t.string :link, null:false
      t.string :title

      t.timestamps
    end
  end
end
