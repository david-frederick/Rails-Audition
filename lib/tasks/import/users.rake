# lib/tasks/import/users.rake
require 'rake'
require 'json'
require 'net/http'
require 'pry'

namespace :import do
  desc 'imports sample users by retrieving and parsing JSON data'
  task users: :environment do

    # retrieve data from the source api and parse it into usable format
    uri = URI('http://jsonplaceholder.typicode.com/users')
    raw_data = Net::HTTP.get(uri)
    hash = JSON.parse(raw_data)

    hash.each do |user|
      # remove unecessary data from user hash
      user = user.delete_if {|key, value| ["address", "company", "geo"].include? key }
      # create entry
      User.create user
    end
  end
end
