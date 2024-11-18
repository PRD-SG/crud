# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :logs, dependent: :destroy

  def admin?
    has_role? :admin
  end
end
