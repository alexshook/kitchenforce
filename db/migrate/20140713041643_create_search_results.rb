class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.references :user, index: true
      t.references :business, index: true

      t.timestamps
    end
    add_index :search_results, [:user_id, :business_id], unique: true
  end
end
