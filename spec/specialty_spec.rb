require ('spec_helper')

describe (Specialty) do
  describe('#name') do
    it('returns the specialty name') do
    test_specialty = Specialty.new({:name => 'Family', :id => nil})
    expect(test_specialty.name()).to(eq('Family'))
    end
  end

  describe('.all') do
    it('will return an empty array') do
      expect(Specialty.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the specialty info') do
      test_specialty = Specialty.new({:name => 'Family', :id => nil})
      test_specialty.save()
      expect(Specialty.all()).to(eq([test_specialty]))
    end
  end


end
