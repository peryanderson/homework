class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.belongs_to :song
      t.belongs_to :genre

      t.timestamps
    end
  end
end
