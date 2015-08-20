class CreateMoos < ActiveRecord::Migration
  def change
    create_table :moos do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
