class CreateLinksubs < ActiveRecord::Migration
  def change
    create_table :linksubs do |t|
      t.integer :link_id
      t.integer :sub_id
      t.timestamps
    end
  end
end
