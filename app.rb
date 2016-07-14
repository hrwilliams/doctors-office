require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/doctor")
require("./lib/patient")
require("./lib/specialty")
 


DB = PG.connect({:dbname => "doctors_office"})

get("/") do
  erb(:index)
end

get("doctors/new") do
  erb(:doctor_form)
end

post("/doctors") do
  name = params.fetch("name")
  specialty = Specialty.new({:name => name, :id => id})
  specialty.save()
  erb(:doctor_success)
end
