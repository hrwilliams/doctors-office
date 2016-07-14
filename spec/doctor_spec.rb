require("spec_helper")

describe(Doctor) do
  describe ('#name') do
    it ('tells you the doctors name') do
      test_doctor = Doctor.new({:name => 'Dr. Smith', :specialty_id => nil, :id => nil})
      expect(test_doctor.name()).to(eq('Dr. Smith'))
    end
  end

  describe('#specialty_id') do
    it('tells you the doctors specialty id') do
      test_doctor = Doctor.new({:name => 'Dr. Smith', :id => nil, :specialty_id => 1})
      expect(test_doctor.specialty_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('will remain empty at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('add a doctor to the array of saved doctors') do
      test_doctor = Doctor.new({:name => 'Dr. Smith', :id => nil, :specialty_id => 1})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe('#patients_doctor_assignment') do
  it('will display a list of patients assigned to a particular doctor') do
    test_doctor = Doctor.new({:name => 'Dr. Deodhar', :id => nil, :specialty_id => 1})
    test_doctor.save
    patient1 = Patient.new({:name => 'HRW', :birth_date => '1980-01-01', :doctor_id => test_doctor.id()})
    patient1.save()
    patient2 = Patient.new({:name => 'DRW', :birth_date => '1977-02-02', :doctor_id => test_doctor.id()})
    patient2.save()
    expect(test_doctor.patients_doctor_assignment()).to(eq([patient1, patient2]))
    end
  end

  describe("#==") do
    it("is the same dr if the info matches") do
      task1 = Doctor.new({:name => 'Dr. Smith', :specialty_id => nil, :id => nil})
      task2 = Doctor.new({:name => 'Dr. Smith', :specialty_id => nil, :id => nil})
      expect(task1).to(eq(task2))
    end
  end
end
