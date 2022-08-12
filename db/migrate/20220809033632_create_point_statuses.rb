# frozen_string_literal: true

class CreatePointStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :point_statuses do |t|
      t.integer :status, null: false, default: 0
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
