class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.string :name, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :osm_id, limit: 8

      t.timestamps
    end

    add_index :interests, :name, unique: true
    add_index :places, :osm_id, unique: true

    create_join_table :interests, :users do |t|
      t.index :interest_id
      t.index :user_id
    end

    create_join_table :places, :users do |t|
      t.index :place_id
      t.index :user_id
    end
  end
end
