# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :game
  has_many :estimates, dependent: :destroy
end
