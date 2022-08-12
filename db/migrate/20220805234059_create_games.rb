# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :token, null: false
      t.string :name

      t.timestamps
    end
    add_index :games, :token, unique: true
  end
end
