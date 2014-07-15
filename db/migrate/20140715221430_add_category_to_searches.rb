class AddCategoryToSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :type
    add_column :searches, :category, :integer
  end
end
