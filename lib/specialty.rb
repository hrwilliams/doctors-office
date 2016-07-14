class Specialty
  attr_reader(:name, :id, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_specialties = DB.exec("SELECT * FROM specialties;")
    specialties = []
    returned_specialties.each() do |specialty|
      name = specialty.fetch("name")
      id = specialty.fetch("id").to_i()
      specialties.push(Specialty.new({:name => name, :id => id}))
    end
    specialties
  end

  define_method(:save) do
    specialty = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    @id = specialty.first.fetch('id').to_i()
  end

  define_method(:==) do |another_specialty|
    self.name().==(another_specialty.name()).&(self.id().==(another_specialty.id()))
  end
end
