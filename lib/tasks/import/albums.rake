# lib/tasks/import/albums.rake
require 'rake'
require 'json'
require 'net/http'
require 'pry'

namespace :import do
  desc 'imports sample albums by retrieving and parsing JSON data'
  task albums: :environment do

    # retrieve data from the source api and parse it into usable format
    uri = URI('http://jsonplaceholder.typicode.com/albums')
    raw_data = Net::HTTP.get(uri)
    hash = JSON.parse(raw_data)

    hash.each do |album|
      # alter/rename keys as necessary to match db schema
      album["user_id"] = album.delete("userId")
      
      # create entry
      Album.create album
    end
  end
end
