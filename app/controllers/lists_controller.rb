class ListsController < ApplicationController
  def show
    year = params[:year]
    season_num = params[:season_num]
    anime_id = params[:anime_id].to_i
    if year.to_i <= 2021 && year.to_i >= 2014 && season_num.to_i >= 1 && season_num.to_i <= 4
      uri = URI.parse("https://api.moemoe.tokyo/anime/v1/master/#{year}/#{season_num}")
      response = Net::HTTP.get(uri)
      result = JSON.parse(response)
      if anime_id <= result.length
        @title = result[anime_id]["title"]
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  
end
