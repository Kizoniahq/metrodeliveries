class Order < ApplicationRecord
  belongs_to :user
  has_many :locations
  extend FriendlyId
  friendly_id :tracking, use: :slugged
   has_many :payments
  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.delivery_status = "in progress"
      length = 8
      self.tracking = SecureRandom.random_number(10000000000)
      self.paid = "false"
      self.shipment_fee = "$800"
    end
  end
end
