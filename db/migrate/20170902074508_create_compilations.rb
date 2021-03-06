class CreateCompilations < ActiveRecord::Migration
  def change
    create_table :compilations do |t|
      t.belongs_to :user, index:true, foreign_key: true
      t.string :title
      t.text  :description

      t.timestamps null: false
    end
  end
end