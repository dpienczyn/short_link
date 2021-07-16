class AddVisitedCountToLink < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :visited_count, :integer, null: false, default: 0
  end
end
