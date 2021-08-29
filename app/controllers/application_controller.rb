class ApplicationController < ActionController::Base
  def call_json(year, num_season)
    uri = URI.parse("https://api.moemoe.tokyo/anime/v1/master/#{year}/#{num_season}")
    response = Net::HTTP.get(uri)
    @result = JSON.parse(response)
  end

  def call_season_num(season_num)
    if season_num == 1
      @season = "冬（1〜3月）"
    elsif season_num == 2
      @season = "春（4〜6月）"
    elsif season_num == 3
      @season = "夏（7〜9月）"
    elsif season_num == 4
      @season = "秋（10〜12月）"
    end
  end
end
