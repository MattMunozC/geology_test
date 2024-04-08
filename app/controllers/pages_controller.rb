class PagesController < ApplicationController
  def home
    data=Datum.limit(10).offset(100)
    render json: {offset:10,data:data}
  end
  def endpoint1
    page=params[:page].to_i
    per_page=params[:per_page].to_i
    mag_types = params[:mag_type]
    if mag_types.present?
      data=Datum.where(magType:mag_types)
    else
      data=Datum.all
      puts data.count
    end
    if per_page!=0 and per_page<=1000 then
      total=(data.count/per_page).ceil
      if page!=0 then
        data=data.limit(per_page).offset((page-1)*per_page)
      end
      serialize=[]
      data.each do |entry|
        serialize<<{
          id:entry['id'],
          type:"feature",
          attributes:{
            external_id:entry["external_id"],
            magnitude:entry["magnitude"],
            place:entry["place"],
            time:entry["time"],
            tsunami:entry["tsunami"],
            mag_type: entry["magType"],
            title: entry["title"],
            coordinates: {
              longitude: entry["longitude"],
              latitude: entry["latitude"]
            },
            links:{
              external_url:entry["url"]
            }
          }
        }
      end
      render json: {
        data:data,
        pagination:{
          current_page:page,
          total:total,
          per_page:per_page
        }
        }
    else
      render :home
    end
  end
end
