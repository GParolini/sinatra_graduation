require_relative "application_record"

class Contact < ApplicationRecord
  has_many :phone_numbers, dependent: :destroy
  validates :name, presence: true
end

def self.search(search)
  where('name like :pat or content like :pat', :pat => "%#{search}%")
end
