class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string "character_first_name"
      t.string "character_last_name"
      t.integer "movie_id"
      t.integer "actor_id"

      t.timestamps
    end
  end
end
