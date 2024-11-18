# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum :status, { active: 0, archived: 1 }, prefix: true, default: :active
  enum :log_type, { expenses: 0, income: 1 }, prefix: true, default: :expenses

  scope :active, -> { where(status: :active) }
  scope :current_month, -> { active.where(date: (Time.zone.today.beginning_of_month..Time.zone.today.end_of_month)) }
end
