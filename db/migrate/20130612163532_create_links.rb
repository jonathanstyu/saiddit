class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url 
      t.text :text
      t.string :title
      t.integer :submitter_id
      t.timestamps
    end
  end
end
