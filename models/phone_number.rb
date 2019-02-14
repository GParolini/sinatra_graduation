require_relative "application_record"

class PhoneNumber < ApplicationRecord
  belongs_to :contact, class_name: "PhoneNumber",
                      foreign_key: "contact_id"
  validates :phone_number, presence: true
end
