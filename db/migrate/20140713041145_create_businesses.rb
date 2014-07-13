class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :address
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
