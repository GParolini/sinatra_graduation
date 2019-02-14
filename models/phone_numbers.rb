require_relative "application_record"

class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  validates :phone_number, presence: true
end
