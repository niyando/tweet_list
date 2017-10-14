class CreateFavouriteCompilations < ActiveRecord::Migration
  def change
    create_table :favourite_compilations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :compilation, foreign_key: true

      t.timestamps
    end
    add_index :favourite_compilations, [:user_id, :compilation_id], name: 'user_fav', unique: true
  end
end
