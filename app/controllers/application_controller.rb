class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def save_and_flash(model)
    result = model.save
    if result
      flash[:status] = :success
      flash[:message] = "Sucessfully saved #{model.class} #{model.id}"
    else
      flash.now[:status] = :failure
      flash.now[:message] = "failed to save #{model.class}"
      flash.now[:details] = model.errors.messages
    end
    return result
  end
end
