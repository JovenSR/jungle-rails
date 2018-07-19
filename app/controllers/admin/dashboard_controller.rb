class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_USER'], password: ENV['BASIC_PASSWORD']
  def show
  end
end
