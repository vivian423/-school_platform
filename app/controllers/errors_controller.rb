# app/controllers/errors_controller.rb
class ErrorsController < ApplicationController
  def not_found
    authorize :error, :not_found?
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  def internal_server
    render status: 500
  end
end
