class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale_from_url

  def default_url_options(options={})
    { :locale => I18n.locale}
  end

  private

  def set_locale_from_url
    I18n.locale = params[:locale] ||= I18n.default_locale
  end

end
