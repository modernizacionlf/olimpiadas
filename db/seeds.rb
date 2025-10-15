# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  'instituto secundario san miguel',
  'instituto técnico regional',
  'colegion secundario los álamos'
].each do |institute_name|
  Institute.create!(name: institute_name)
end

san_miguel = Institute.find(1)
tecnico_regional = Institute.find(2)
los_alamos = Institute.find(3)

[
  {
    institute: san_miguel,
    students: [
      [ 'martín', 'lópez', 17 ],
      [ 'camila', 'rodríguez', 18 ],
      [ 'sofía', 'herrera', 16 ]
    ]
  },
  {
    institute: tecnico_regional,
    students: [
      [ 'maria', 'pérez', 18 ],
      [ 'juan', 'gómez', 18 ],
      [ 'diego', 'castillo', 17 ]
    ]
  },
  {
    institute: los_alamos,
    students: [
      [ 'mateo', 'morales', 16 ],
      [ 'sebastián', 'torres', 17 ],
      [ 'isabella', 'sánchez', 17 ]
    ]
  }
].each do |institute_hash|
  institute = institute_hash[:institute]
  students = institute_hash[:students]

  students.each do |first_name, last_name, age|
    institute.students.create!(
      first_name: first_name,
      last_name: last_name,
      age: age
    )
  end
end
