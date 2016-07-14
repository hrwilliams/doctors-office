class Patient
  attr_reader(:name, :birth_date, :doctor_id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birth_date = attributes.fetch(:birth_date)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birth_date = patient.fetch("birth_date")
      doctor_id = patient.fetch("doctor_id").to_i()
      patients.push(Patient.new({:name => name, :birth_date => birth_date, :doctor_id => doctor_id}))
    end
    patients
  end

  define_method(:save) do
    patient = DB.exec("INSERT INTO patients (name, birth_date, doctor_id) VALUES ('#{@name}', '#{@birth_date}', #{@doctor_id});")
  end

  define_method(:==) do |another_patient|
    self.name().==(another_patient.name()).&(self.birth_date().==(another_patient.birth_date())).&(self.doctor_id().==(another_patient.doctor_id()))
  end

end
