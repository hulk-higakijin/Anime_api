class SearchController < ApplicationController
  def search
    @year = params[:year]
    @season_num = params[:season]
    if @year.to_i <= 2021 && @year.to_i >= 2014 && @season_num.to_i >= 1 && @season_num.to_i <= 4
      uri = URI.parse("https://api.moemoe.tokyo/anime/v1/master/#{@year}/#{@season_num}")
      response = Net::HTTP.get(uri)
      @result = JSON.parse(response)
      if @season_num == "1"
        season = "冬（1〜3月）"
      elsif @season_num == "2"
        season = "春（4〜6月）"
      elsif @season_num == "3"
        season = "夏（7〜9月）"
      elsif @season_num == "4"
        season = "秋（10〜12月）"
      end
      @season = season
      
    end
  end
end
