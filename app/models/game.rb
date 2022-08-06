class Game < ApplicationRecord
  has_many :players, dependent: :destroy

  before_validation :set_token, on: :create

  validates :token, presence: true, uniqueness: true

  def to_param
    token
  end

  private

  def set_token
    self.token = SecureRandom.urlsafe_base64(16)
  end
end
