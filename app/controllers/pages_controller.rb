class PagesController < ApplicationController
  def home
    @line = Line.all
  end

  def issues
  end

  def my_profile
    @line = Line.all
    @user = User.all
  end
end
