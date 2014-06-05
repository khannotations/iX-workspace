class User < ActiveRecord::Base
  has_many :tweets

  # validates take a property, and stuff to validate
  validates :handle, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # validate takes a method name in its symbol form
  validate :handle_must_start_with_at

  # validates_uniqueness_of :handle

  def handle_must_start_with_at
    if self.handle[0] != "@"
      self.errors.add(:handle, "must start with @")
    end
  end
end
