class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :address
      t.string :type
      t.float :lat
      t.float :lng
      t.integer :distance

      t.timestamps
    end
  end
end
