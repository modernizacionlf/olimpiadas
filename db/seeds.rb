# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(
  email_address: 'admin@gmail.com',
  password: 'test',
  password_confirmation: 'test',
  admin: true
)

# Lugares
['cef', 'natatorio municipal', 'polideportivo municipal'].each do |place|
  Place.create!(name: place)
end

# Deportes
%w[tenis natacion futbol].each do |sport|
  Sport.create!(name: sport)
end

['fase de grupos', 'octavos', 'cuartos', 'semifinal', 'final'].each do |game_instance|
  GameInstance.create!(name: game_instance)
end

# Actividades
%w[cultural sport].each do |activity_type|
  ActivityType.create!(name: activity_type)
end

activities = [
  {
    game_instance: 'fase de grupos',
    sport: 'futbol',
    activity_type: 'sport',
    place: 'cef',
    date_of: Date.today.next_day(5),
    start_at: '16:00',
    end_at: '17:00'
  },
  {
    game_instance: 'fase de grupos',
    sport: 'futbol',
    activity_type: 'sport',
    place: 'cef',
    date_of: Date.today.next_day(7),
    start_at: '16:30',
    end_at: '17:30'
  },
]

activities.each do |activity|
  game_instance = GameInstance.find_by(name: activity[:game_instance])
  sport = Sport.find_by(name: activity[:sport])
  game = Game.create!(sport: sport, instance: game_instance)


  activity_type = ActivityType.find_by(name: activity[:activity_type])
  place = Place.find_by(name: activity[:place])

  Activity.create!(
    date_of: activity[:date_of],
    start_at: activity[:start_at],
    end_at: activity[:end_at],
    place: place,
    activity_type: activity_type,
    game: game
  )
end

# Escuela Normal Dummy
escuela_normal = Institute.create!(name: 'escuela normal')

sociales = escuela_normal.promos.create!(name: 'sociales')
sociales.logo.attach(
  io: File.open(
    Rails.root.join(
      'app', 'assets', 'images', 'promos', 'logo.jpeg'
    )
  ),
  filename: 'logo.jpeg',
  content_type: 'image/jpeg'
)

sociales_students = [
  { first_name: 'juan', last_name: 'perez', age: 18 },
  { first_name: 'ana', last_name: 'gomez', age: 17 },
  { first_name: 'carlos', last_name: 'rodriguez', age: 18 },
  { first_name: 'maria', last_name: 'lopez', age: 19, delegate: true },
  { first_name: 'luis', last_name: 'fernandez', age: 18 }
]
  
sociales_students.each do |student|
  sociales.students.create!(student)
end


naturales = escuela_normal.promos.create(name: 'naturales')
naturales.logo.attach(
  io: File.open(
    Rails.root.join(
      'app', 'assets', 'images', 'promos', 'logo.jpeg'
    )
  ),
  filename: 'logo.jpeg',
  content_type: 'image/jpeg'
)

naturales_students = [
  { first_name: 'pedro', last_name: 'martinez', age: 18, delegate: true },
  { first_name: 'lucia', last_name: 'sanchez', age: 17 },
  { first_name: 'laura', last_name: 'garcia', age: 18 },
  { first_name: 'roberto', last_name: 'torres', age: 18 },
  { first_name: 'jose', last_name: 'zeballos', age: 17 }
]

naturales_students.each do |student|
  naturales.students.create!(student)
end

# Escuela San Miguel Dummy
san_miguel = Institute.create!(name: 'escuela san miguel')

economia = san_miguel.promos.create!(name: 'economia')

economia_students = [
  { first_name: 'martin', last_name: 'gonzales', age: 18 },
  { first_name: 'cecilia', last_name: 'sosa', age: 17 },
  { first_name: 'ricardo', last_name: 'lopez', age: 18, delegate: true },
  { first_name: 'valentina', last_name: 'mendez', age: 18 },
  { first_name: 'federico', last_name: 'castillo', age: 17 }
]

economia_students.each do |student|
  economia.students.create!(student)
end

economia.logo.attach(
  io: File.open(
    Rails.root.join(
      'app', 'assets', 'images', 'promos', 'logo.jpeg'
    )
  ),
  filename: 'logo.jpeg',
  content_type: 'image/jpeg'
)

# Fusion Escuela 4 y Escuela 21 Dummy
escuela_4 = Institute.create!(name: 'escuela 4')

musica = escuela_4.promos.create(name: 'musica')
musica.logo.attach(
  io: File.open(
    Rails.root.join(
      'app', 'assets', 'images', 'promos', 'logo.jpeg'
    )
  ),
  filename: 'logo.jpeg',
  content_type: 'image/jpeg'
)

musica_students = [
  { first_name: 'luciano', last_name: 'perez', age: 18 },
  { first_name: 'agustina', last_name: 'diaz', age: 17, delegate: true },
  { first_name: 'tomas', last_name: 'ramirez', age: 18 }
]

musica_students.each do |student|
  musica.students.create!(student)
end


escuela_21 = Institute.create!(name: 'escuela 21')

arte = escuela_21.promos.create(name: 'arte')
arte.logo.attach(
  io: File.open(
    Rails.root.join(
      'app', 'assets', 'images', 'promos', 'logo.jpeg'
    )
  ),
  filename: 'logo.jpeg',
  content_type: 'image/jpeg'
)

arte_students = [
  { first_name: 'renata', last_name: 'rios', age: 18, delegate: true },
  { first_name: 'nicolas', last_name: 'vera', age: 17 }
]

arte_students.each do |student|
  arte.students.create!(student)
end

# Actividades
Activity.find(1).students << [escuela_normal.promos[0].students, san_miguel.promos[0].students]

activity = Activity.find(2)
activity.students << [escuela_21.promos[0].students, escuela_4.promos[0].students, san_miguel.promos[0].students]

escuela_4_students = escuela_4.promos[0].students
escuela_21_students = escuela_21.promos[0].students

ActivityStudent.where(
  activity_id: activity.id,
  student_id: escuela_4_students.pluck(:id)
).update_all(together: true)

ActivityStudent.where(
  activity_id: activity.id,
  student_id: escuela_21_students.pluck(:id)
).update_all(together: true)
