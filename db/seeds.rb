User.create!(
  email_address: 'admin@gmail.com',
  password: 'test',
  password_confirmation: 'test',
  admin: true
)

# Lugares
[
  'parque plaza montero',
  'teatro español',
  'C.E.F. N°6',
  'la terraza',
  'centro recreativo municipal',
].each do |place|
  Place.create!(name: place)
end

# Deportes
['futbol', 'basquet', 'ping pong'].each do |sport|
  Sport.create!(name: sport)
end

['primera fase', 'primer partido', 'fase de grupos', 'octavos', 'cuartos', 'semifinal', 'final'].each do |game_instance|
  GameInstance.create!(name: game_instance)
end

# Actividades
%w[cultural sport].each do |activity_type|
  ActivityType.create!(name: activity_type)
end

sport_activities = [
  {
    game_instance: 'fase de grupos',
    sport: 'futbol',
    place: 'la terraza',
    date_of: Date.today.next_day(5),
    start_at: '16:00',
    end_at: '17:00'
  },
  {
    game_instance: 'fase de grupos',
    sport: 'futbol',
    place: 'la terraza',
    date_of: Date.today.next_day(7),
    start_at: '16:30',
    end_at: '17:30'
  },
  {
    game_instance: 'primera fase',
    sport: 'ping pong',
    place: 'centro recreativo municipal',
    date_of: Date.today.next_day(3),
    start_at: '17:00',
    end_at: '18:30'
  },
  {
    game_instance: 'primer partido',
    sport: 'basquet',
    place: 'C.E.F. N°6',
    date_of: Date.today.next_day(3),
    start_at: '17:00',
    end_at: '18:30'
  }
]

sport_activities.each do |activity|
  game_instance = GameInstance.find_by(name: activity[:game_instance])
  sport = Sport.find_by(name: activity[:sport])
  game = Game.create!(sport: sport, instance: game_instance)

  activity_type = ActivityType.find_by(name: 'sport')
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

cultural_activities = [
  {
    title: 'se realizó la etapa ambiental de las olimpíadas juveniles florenses',
    description: 'De esta manera quedó inaugurado el «Jardín de Mariposas» en nuestra querida laguna, aquí los jóvenes podrán disfrutar junto a sus familias y amigos de este lugar que ellos mismos crearon.',
    date_of: Date.today.next_day(4),
    start_at: '16:00',
    end_at: '18:00',
    filename: 'etapa_ambiental',
    content_type: 'jpeg',
    place: 'parque plaza montero'
  },
  {
    title: 'llega el certamen de preguntas y respuestas de la etapa educativa de las olimpíadas juveniles florenses',
    description: 'Durante la tarde se desarrollará el tradicional certamen de preguntas y respuestas donde alumnos y alumnas de las Escuelas participantes deberán contestar sobre matemáticas, geografía, historia de Las Flores, cultura general, entre otros ejes temáticos. En marco de esta instancia, los estudiantes vienen realizando capacitaciones y pruebas a través de las cuales practican sobre la dinámica que utilizarán para responder las preguntas y las herramientas tecnológicas que se usarán para el concurso.',
    date_of: Date.today.next_day(5),
    start_at: '15:00',
    end_at: '17:00',
    filename: 'preguntas_y_respuestas',
    content_type: 'jpg',
    place: 'teatro español'
  }
]

cultural_activities.each do |activity|
  cultural = Cultural.create!(
    title: activity[:title],
    description: activity[:description]
  )
  cultural.image.attach(
    io: File.open(
      Rails.root.join(
        'app', 'assets', 'images', 'cultural', "#{activity[:filename]}.#{activity[:content_type]}"
      )
    ),
    filename: "#{activity[:filename]}.#{activity[:content_type]}",
    content_type: "image/#{activity[:content_type]}"
  )

  activity_type = ActivityType.find_by(name: 'cultural')
  place = Place.find_by(name: activity[:place])

  Activity.create(
    date_of: activity[:date_of],
    start_at: activity[:start_at],
    end_at: activity[:end_at],
    place: place,
    activity_type: activity_type,
    cultural: cultural
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

# Noticias
notices = [
  {
    title: 'se realizó la etapa ambiental de las olimpíadas juveniles florenses',
    description: 'De esta manera quedó inaugurado el «Jardín de Mariposas» en nuestra querida laguna, aquí los jóvenes podrán disfrutar junto a sus familias y amigos de este lugar que ellos mismos crearon.',
    filename: 'etapa_ambiental',
    content_type: 'jpeg'
  },
  {
    title: 'llega el certamen de preguntas y respuestas de la etapa educativa de las olimpíadas juveniles florenses',
    description: 'Durante la tarde se desarrollará el tradicional certamen de preguntas y respuestas donde alumnos y alumnas de las Escuelas participantes deberán contestar sobre matemáticas, geografía, historia de Las Flores, cultura general, entre otros ejes temáticos. En marco de esta instancia, los estudiantes vienen realizando capacitaciones y pruebas a través de las cuales practican sobre la dinámica que utilizarán para responder las preguntas y las herramientas tecnológicas que se usarán para el concurso.',
    filename: 'preguntas_y_respuestas',
    content_type: 'jpg'
  },
  {
    title: 'con gran éxito y un excelente nivel de las olimpíadas juveniles florenses',
    description: 'En este caso fue el turno de la Etapa Deportiva 2, compuesta por Natación, Básquet y Tejo.
      El miércoles, en una vibrante tarde de feriado, las instalaciones de la pileta climatizada del Natatorio Municipal “Hugo Mauro” se llenaron de color con la competencia de natación. Las categorías disputadas fueron 50 metros libre (masculino y femenino), 50 metros pecho (masculino y femenino) y posta mixta, quedando en 1° lugar el Colegio San Miguel según la sumatoria de puntos. El viernes en el gimnasio del C.E.F. N°6 se disputó uno de los deportes más esperados: el básquet. Los equipos desplegaron todo su talento y resultó ganadora la Secundaria N°1 (Escuela Media). Por último, el sábado se llevó a cabo la competencia de Tejo. Los chicos compartieron una emocionante jornada con los adultos mayores del Centro Tejista Florense, donde participaron en conjunto en tres categorías y el primer puesto fue compartido por la Escuela Dante Alighieri; la Secundaria N°2 (Normal) y el equipo conformado por la Escuela Técnica, la Secundaria N°3 y la Secundaria N°4.',
    filename: 'natacion',
    content_type: 'jpg'
  },
  {
    title: 'en una vibrante jornada de tenis de mesa, se definió la primera etapa deportiva de las olimpíadas juveniles florenses',
    description: 'Ayer jueves el Centro Recreativo Municipal «Néstor Kirchner» fue el escenario de una tarde llena de color y energía en el marco de una nueva edición de las Olimpíadas.
      Se disputaron las disciplinas de Tenis de Mesa (individual masculino e individual femenino). Las mascotas y las hinchadas, con sus bombos, platillos y hasta megáfonos fueron los protagonistas indiscutidos.',
    filename: 'ping_pong',
    content_type: 'jpg'
  },
  {
    title: 'se disputó el primer deporte de las olimpiadas juveniles florenses',
    description: 'El sábado por la mañana en el complejo La Terraza los equipos participaron del primer encuentro deportivo en el marco de la Etapa Deportiva 1 de las Olimpiadas Juveniles Florenses',
    filename: 'futbol',
    content_type: 'jpg'
  },
  {
    title: 'la escuela dante alighieri ganó las olimpíadas juveniles florenses',
    description: 'Este sábado 15 por la tarde vivimos el gran cierre de las Olimpíadas Juveniles Florenses 2025 y la jornada final estuvo marcada por la Etapa Educativa, presentada en su formato “Gran Juego de la Ciudad”. Los equipos recorrieron Las Flores pasando por distintas postas ubicadas en lugares claves de nuestro patrimonio histórico y natural. Fue una forma distinta de aprender y mirar la ciudad desde otro lugar, acercando nuestra historia a las nuevas generaciones. Al finalizar el recorrido, familias, amigos y equipos se reunieron en Plaza Mitre, donde compartimos los videos que resumieron todas las etapas del año. Finalmente, llegó el momento más esperado: se reveló al gran ganador de la edición 2025, que por la sumatoria total de puntos fue la Escuela Dante Alighieri.',
    filename: 'coronacion',
    content_type: 'jpeg'
  },
]

notices.each do |notice|
  release = Release.build(
    title: notice[:title],
    description: notice[:description]
  )
  release.image.attach(
    io: File.open(
      Rails.root.join(
        'app', 'assets', 'images', 'releases', "#{notice[:filename]}.#{notice[:content_type]}"
      )
    ),
    filename: "#{notice[:filename]}.#{notice[:content_type]}",
    content_type: "image/#{notice[:content_type]}"
  )
  release.save!
end
