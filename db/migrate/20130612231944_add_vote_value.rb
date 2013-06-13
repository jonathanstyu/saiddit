class AddVoteValue < ActiveRecord::Migration
  def change
    add_column :user_votes, :vote_value, :string
  end
end
