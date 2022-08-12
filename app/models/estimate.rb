# frozen_string_literal: true

class Estimate < ApplicationRecord
  belongs_to :player

  def self.save_and_broadcast(player_id, point)
    estimate = Estimate.find_or_initialize_by(player_id:)
    estimate.point = point
    estimate.save!

    estimate.broadcast_update_to estimate.player.game, target: "#{estimate.player_id}_estimate"
  end
end
