require_relative "application_record"

class Phone_number < ApplicationRecord
  belongs_to :contact
  validates :phone_number, presence: true
end
