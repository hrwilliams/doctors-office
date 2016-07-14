require ('spec_helper')

describe(Patient) do
  describe('#name') do
    it('will display the patients name') do
      test_patient = Patient.new({:name => 'HRW', :birth_date => '1980-01-01', :doctor_id => nil})
      expect(test_patient.name()).to(eq('HRW'))
    end
  end

  describe('#birth_date') do
    it('will display the patients birth_date') do
      test_patient = Patient.new({:name => 'HRW', :birth_date => '1980-01-01', :doctor_id => nil})
      expect(test_patient.birth_date()).to(eq('1980-01-01'))
    end
  end

  describe('.all') do
    it('starts off with nothing in the array') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the patients info') do
      test_patient = Patient.new({:name => 'HRW', :birth_date => '1980-01-01', :doctor_id => 1})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe("#==") do
    it("is the same patient if the info matches") do
      patient1 = Patient.new({:name => 'HRW', :birth_date => '1980-01-01-01', :doctor_id => nil})
      patient2 = Patient.new({:name => 'HRW', :birth_date => '1980-01-01-01', :doctor_id => nil})
      expect(patient1).to(eq(patient2))
    end
  end


  describe('#doctor_id') do
    it('will assign a doctor to the patient') do
      test_patient = Patient.new({:name => 'HRW', :birth_date => '199--01-01', :doctor_id => 1})
      test_patient.save()
      expect(test_patient.doctor_id()).to(eq(1))
    end
  end

end
