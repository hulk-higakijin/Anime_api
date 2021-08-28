class SearchController < ApplicationController
  def search
    year = params[:year]
    season = params[:season]
    if year.present? && season.present?
      uri = URI.parse("https://api.moemoe.tokyo/anime/v1/master/#{year}/#{season}")
      response = Net::HTTP.get(uri)
      @result = JSON.parse(response)
    else
    end
  end
end
