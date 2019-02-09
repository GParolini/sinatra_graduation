require_relative "application_record"

class Contact < ApplicationRecord
  validates :phone_name, presence: true
  has_many :phone_numbers, dependent: :destroy
end
