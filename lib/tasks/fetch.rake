namespace :fetch do
    desc "get info from earthquake.usgs.gov API"
    task :get_info => :environment do
        response=HTTParty.get("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")
        @response=JSON.parse(response.body)
        response['features'].each do |entry|
            properties=entry['properties']
            geometry=entry['geometry']['coordinates']
            fetched={   external_id: entry['id'],
                        url: properties['url'],
                        title: properties['title'],
                        place: properties['place'],
                        magType: properties['magType'],
                        magnitude: properties['mag'],
                        latitude: geometry[0],
                        longitude: geometry[1],
                        time: properties["time"],
                        tsunami: properties["tsunami"]
                    }
            saved=Datum.new(fetched)
            if saved.save
                puts 'entry saved'
            else
                puts 'entry ignored'
            end
        end
    end
end