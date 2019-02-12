require_relative "application_record"

class PhoneNumber < ApplicationRecord
  belongs_to :contact
  validates :phone_number, presence: true
end
