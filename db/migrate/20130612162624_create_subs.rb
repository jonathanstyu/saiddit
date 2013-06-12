class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :category
      t.integer :moderator_id
      t.timestamps
    end
  end
end
