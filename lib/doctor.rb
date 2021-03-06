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

  define_method(:save) do
      doctor = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', '#{@specialty_id}') RETURNING id;")
      @id = doctor.first.fetch('id').to_i()
  end

  define_method(:==) do |another_doctor|
    self.name().==(another_doctor.name()).&(self.specialty_id().==(another_doctor.specialty_id())).&(self.id().==(another_doctor.id()))
  end

  define_method(:patients_doctor_assignment) do
    patients_list = []
    returned_patient_list = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()};")
    returned_patient_list.each() do |patient|
      name = patient.fetch("name")
      birth_date = patient.fetch("birth_date")
      doctor_id = patient.fetch("doctor_id").to_i()
      patients_list.push(Patient.new({:name => name, :birth_date => birth_date, :doctor_id => doctor_id, :id => id}))
    end
    patients_list
  end
end
