require("spec_helper")

DB = PG.connect({:dbname => 'doctors_office_test'})

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

end