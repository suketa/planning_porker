# frozen_string_literal: true

class CreateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :estimates do |t|
      t.string :point
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
