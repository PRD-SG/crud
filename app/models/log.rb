# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum :status, { active: 0, archived: 1 }, prefix: true, default: :active
  enum :log_type, { expenses: 0, income: 1 }, prefix: true, default: :expenses

  scope :active, -> { where(status: :active) }
  scope :current_month, lambda {
    active.where(date: (Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)).order(date: :desc)
  }
end
