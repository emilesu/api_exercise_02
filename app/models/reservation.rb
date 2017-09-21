class Reservation < ApplicationRecord
  validates_presence_of :train_id, :seat_number, :booking_code
  validates_uniqueness_of :seat_number, :scope => :train_id

  belongs_to :user, :optional => true
  belongs_to :train


  # 在每个座位(Reservation)新建的时候,随机产生一个booking_code的 订票号码.
  before_validation :generate_booking_code, :on => :create

  def generate_booking_code
    self.booking_code = SecureRandom.uuid
  end

end
