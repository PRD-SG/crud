# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :logs, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
