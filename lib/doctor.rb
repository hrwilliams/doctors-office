class Doctor
  attr_reader(:name, :specialty_id, :id)

  define_method(:initialize) do |attributes|
   @name = attributes.fetch(:name)
   @specialty_id = attributes.fetch(:specialty_id)
   @id = attributes.fetch(:id)
 end

 define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty_id = doctor.fetch("specialty_id").to_i()
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:name => name, :specialty_id => specialty_id, :id => id}))
    end
    doctors
  end

  describe("#save") do
    it ("lets you dave doctors to the database")
  end

end
