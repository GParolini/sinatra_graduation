require_relative "application_record"

class Contact < ApplicationRecord
  has_many :phone_numbers, dependent: :destroy
  validates :name, presence: true
end
