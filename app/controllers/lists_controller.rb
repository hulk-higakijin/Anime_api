class ListsController < ApplicationController
  def show
    year = params[:year].to_i
    season_num = params[:season_num].to_i
    @anime_id = params[:anime_id].to_i
    if year <= 2021 && year >= 2014 && season_num >= 1 && season_num <= 4
      call_json(year, season_num)
      if @anime_id <= @result.length
        
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
