# frozen_string_literal: true

class PointStatus < ApplicationRecord
  belongs_to :game

  def status_class
    case status
    when 0
      'hide_point'
    when 1
      'open_point'
    end
  end

  broadcasts_to :game
end
