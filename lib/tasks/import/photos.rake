# lib/tasks/import/photos.rake
require 'rake'
require 'json'
require 'net/http'
require 'pry'

namespace :import do
  desc 'imports sample photos by retrieving and parsing JSON data'
  task photos: :environment do

    # retrieve data from the source api and parse it into usable format
    uri = URI('http://jsonplaceholder.typicode.com/photos')
    raw_data = Net::HTTP.get(uri)
    hash = JSON.parse(raw_data)

    binding.pry

    hash.each do |photo|
      # rename keys as necessary to match db schema
      photo["album_id"] = photo.delete("albumId")
      photo["thumbnail_url"] = photo.delete("thumbnailUrl")

      # create entry
      Photo.create photo
    end
  end
end
