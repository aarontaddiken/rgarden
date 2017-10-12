class AddReIdToUsersTable < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :contact, foreign_key: true, column: :rep_id
  end
end
