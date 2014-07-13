class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :text

      t.timestamps
    end
  end
end
