class AddCounterCacheToCompilations < ActiveRecord::Migration
  def change
    add_column :compilations, :fave_count, :integer, default: 0, after: 'description'
  end
end
