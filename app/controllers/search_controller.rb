require "date"

class SearchController < ApplicationController
  def now
    dt = Date.today
    @year = dt.year
    if dt.month.between?(1,3)
      @season_num = 1
    elsif dt.month.between?(4,6)
      @season_num = 2
    elsif dt.month.between?(7,9)
      @season_num = 3
    elsif dt.month.between?(10,12)
      @season_num = 4
    end
    call_json(@year, @season_num)
    call_season_num(@season_num)
    render "search"
  end

  def search
    @year = params[:year].to_i
    @season_num = params[:season].to_i
    if @year <= 2021 && @year >= 2014 && @season_num >= 1 && @season_num <= 4
      call_json(@year, @season_num)
      call_season_num(@season_num)
    end
  end
end
