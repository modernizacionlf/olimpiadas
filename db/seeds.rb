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

[
  [
    'inicia la XX olimpiada estudiantil nacional 2025',
    'La ciudad de Mendoza dio la bienvenida a más de 3.000 jóvenes de todo el país para participar en la vigésima edición de la Olimpiada Estudiantil Nacional. Durante una semana, los estudiantes competirán en disciplinas científicas, deportivas y artísticas, promoviendo la excelencia y el trabajo en equipo.'
  ],
  [
    'récord de participación en la olimpiada de ciencias',
    'Más de 500 alumnos de secundaria participaron en la Olimpiada Nacional de Ciencias, donde presentaron experimentos innovadores sobre energía sustentable y biotecnología. El jurado destacó el alto nivel de creatividad y rigor científico mostrado por los competidores.'
  ],
  [
    'teatro y creatividad brillan en la olimpiada cultural',
    'El certamen teatral de la Olimpiada Estudiantil sorprendió con obras originales que abordaron temas sociales y medioambientales. El grupo del Colegio San Martín se llevó el primer lugar con su puesta en escena “Voces del Futuro”.'
  ],
  [
    'final de fútbol estudiantil termina con empate histórico',
    'la final de fútbol masculino entre el Instituto Central y la Escuela Técnica N°4 terminó 2-2 tras un intenso encuentro. La definición por penales coronó campeones a los técnicos, que dedicaron su triunfo a su entrenador recientemente jubilado.'
  ],
  [
    'jóvenes artistas exponen sus obras en la olimpiada de arte',
    'en el marco de la Olimpiada Estudiantil, se inauguró una muestra con más de 200 obras de pintura, fotografía y escultura. Los temas giraron en torno a la identidad juvenil y la diversidad cultural, recibiendo elogios del público y la crítica local.'
  ],
  [
    'estudiante de 14 años gana la olimpiada de matemáticas',
    'Sofía Ríos, alumna de primer año, sorprendió al jurado al resolver en tiempo récord los problemas más complejos de la competencia. Su desempeño la clasificó directamente para representar al país en la Olimpiada Internacional de Matemáticas.'
  ],
  [
    'olimpiada estudiantil impulsa la inclusión y el trabajo en equipo',
    'Este año se implementaron nuevas categorías mixtas y adaptadas para estudiantes con discapacidad, promoviendo la participación equitativa. Los organizadores destacaron el impacto positivo de la iniciativa en la convivencia escolar.'
  ],
  [
    'clausura con mensaje ecológico y compromiso juvenil',
    'El acto de cierre de la Olimpiada Estudiantil incluyó la plantación simbólica de 1.000 árboles en el Parque Central. Los delegados estudiantiles firmaron un compromiso ambiental para reducir el uso de plásticos y fomentar el reciclaje en sus escuelas.'
  ]
].each do |release|
  title = release[0]
  description = release[1]

  Release.create!(
    title:title,
    description:description
  )
end

[ 'fútbol', 'basquet', 'voley', 'hockey', 'tenis', 'handball' ].each do |sport_name|
  Sport.create!(name: sport_name)
end

[
  'fase de grupo',
  'octavos',
  'cuartos',
  'semifinal',
  'final'
].each do |instance_game|
  GameInstance.create!(name: instance_game)
end

Game.create!(game_instance_id: 2)
