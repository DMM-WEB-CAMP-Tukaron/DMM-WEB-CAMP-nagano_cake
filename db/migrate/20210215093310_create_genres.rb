class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamp :update_at
      t.timestamp :create_at

      t.timestamps
    end
  end
end
