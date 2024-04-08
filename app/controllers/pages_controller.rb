class PagesController < ApplicationController
  def home
    response=HTTParty.get("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")
    @response=JSON.parse(response.body)
  end
end
