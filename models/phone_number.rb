require_relative "application_record"

class Phone_number < ApplicationRecord
  validates :number, presence: true
  belongs_to :contact
end
