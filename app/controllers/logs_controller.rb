# frozen_string_literal: true

class LogsController < ApplicationController
  def index
    @logs = Log.current_month.last(25).group_by(&:date)
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
    @logs = Log.current_month.group_by(&:date)
  end

  def report
    return if params[:start_date].blank? || params[:end_date].blank?

    start_date = Date.parse(params[:start_date]).beginning_of_day
    end_date = Date.parse(params[:end_date]).end_of_day

    @logs = Log.where(date: start_date..end_date).group_by(&:date)
  end

  private

  def log_params
    params.require(:log).permit(:title, :value, :log_type, :category_id, :user_id, :date)
  end
end
