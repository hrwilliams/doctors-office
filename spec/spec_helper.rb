require("rspec")
require("pg")
require("doctor")
require("patient")
require("specialty")
require('pry')
# require('capybara/rspec')
# Capybara.app = Sinatra::Application

DB = PG.connect({:dbname => "doctors_office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM specialties *;")
  end
end
