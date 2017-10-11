class PagesController < ApplicationController
  def home
    @line = Line.all
    @iteration = Iteration.all
    @next_drop = @iteration.where('date_of_drop > ?', Date.today).order(:date_of_drop).first.date_of_drop
  end

  def issues
  end

  def my_profile
    @line = Line.all
    @user = User.all
  end
end
