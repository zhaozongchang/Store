class WelcomeController < ApplicationController
  def index
    flash[:notice] = "你好，世界！"
  end
end
