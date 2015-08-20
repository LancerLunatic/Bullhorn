class AddUserIdToMoos < ActiveRecord::Migration
  def change
    add_column :moos, :user_id, :integer
  end
end
