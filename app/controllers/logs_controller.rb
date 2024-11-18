# frozen_string_literal: true

class LogsController < ApplicationController
  def index
    @logs = Log.current_month.last(10)
    @income = Log.current_month.where(log_type: :income).sum(:value)
    @expenses = Log.current_month.where(log_type: :expenses).sum(:value)
  end

  def create
    log = Log.new(log_params)
    if log.save
      redirect_to logs_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def all
    @logs = Log.current_month
  end

  private

  def log_params
    params.require(:log).permit(:title, :value, :log_type, :category_id, :user_id, :date)
  end
end
