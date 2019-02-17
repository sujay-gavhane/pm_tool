class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, :with => :permission_denied unless ["development"].include?(Rails.env)
  rescue_from ActiveRecord::RecordNotFound, :with => :routing_error unless ["development"].include?(Rails.env)
  rescue_from NoMethodError, :with => :routing_error unless ["development"].include?(Rails.env)
  rescue_from ActionView::MissingTemplate, with: :routing_error unless ["development"].include?(Rails.env)


  def permission_denied(exception)
    respond_to do |format|
      format.html{ render :file => "#{Rails.root}/public/permission_denied.html.erb", :status => 404 }
    end
  end

  def routing_error(exception=nil)
    render file: "#{Rails.root}/public/404.html", status: 404
  ends
end
