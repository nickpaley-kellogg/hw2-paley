class CreateActors < ActiveRecord::Migration[7.1]
  def change
    create_table :actors do |t|
      t.string "first_name"
      t.string "last_name"
      t.integer "movie_id"
      t.integer "role_id"

      t.timestamps
    end
  end
end
