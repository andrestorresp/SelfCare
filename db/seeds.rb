Consultation.destroy_all
Blog.destroy_all
Doctor.destroy_all
Patient.destroy_all
User.destroy_all

def crear_usuario(email, password, role, first_name, last_name, address, latitude, longitude, dni, phone_number, age, photo_path)
  usuario = User.new(
    email: email,
    password: password,
    role: role,
    first_name: first_name,
    last_name: last_name,
    address: address,
    latitude: latitude,
    longitude: longitude,
    dni: dni,
    phone_number: phone_number,
    age: age
  )
  usuario.photo.attach(io: File.open(photo_path), filename: File.basename(photo_path), content_type: 'image/jpeg')

  if usuario.save
    puts "#{first_name} insertado correctamente"
  else
    puts "Error al insertar #{first_name}: #{usuario.errors.full_messages}"
  end
end

# Creación de Usuarios
crear_usuario("alvarorg2111@gmail.com", "12345678", false, "Alvaro", "Raga", "Monte Bello Plaza", 10.359272059129669, -66.97594958444186, 28154771, "1234567890", 22, 'app/assets/images/perfiles/Perfil_Alvaro.jpg')
crear_usuario("alberto.manrique99@gmail.com", "12345678", false, "Gabriel", "Manrique", "Monte Bello Plaza", 10.36859487233048, -66.99592860600289, 28921249, "04140156629", 25, 'app/assets/images/perfiles/Perfil_Gabriel.jpeg')

# Creación de los pacientes

def creacion_paciente(alergy, observation)
  last_two_user_ids = User.order(id: :desc).limit(2).pluck(:id)
  patient = Patient.new(
    alergy: alergy,
    observation: observation,
    user_id: last_two_user_ids.sample
  )
  if patient.save
    puts "Paciente creado correctamente"
  else
    puts "Error al crear el paciente"
  end
end

def creacion_doctor(specialty, sap)
  last_user_id = User.order(id: :desc).pluck(:id).first
  doctor = Doctor.new(
    specialty: specialty,
    sap: sap,
    user_id: last_user_id
  )

  if doctor.save
    puts "Doctor creado correctamente"
  else
    puts "Error al crear el doctor"
  end
end

# Creación de Pacientes
creacion_paciente("Analgésicos antiinflamatorios no esteroides", "El paciente no debe de usar Analgésicos antiinflamatorios. Estos pueden causar irritación o daño en el revestimiento del estómago y el tracto gastrointestinal.")
creacion_paciente("Penicilina", "Evita tomar cualquier medicamento que contenga penicilina u otros antibióticos relacionados sin consultar primero, puedes tener dificultades al resporar y reacciones alergicas")

# Creación de Usuarios al mismo tiempo que Doctores (Observar bien)
crear_usuario("leonardocabrices1@gmail.com", "12345678", true, "Leonardo", "Parra", "Monte Bello Plaza", 10.359272059129669, -66.97594958444186, 26466787, "0987654321", 25, 'app/assets/images/perfiles/Perfil_Leonardo.png')
creacion_doctor("Traumatologo", "8190851")
crear_usuario("dragotorres16@gmail.com", "12345678", true, "Andres", "Torres", "Monte Bello Plaza", 10.359272059129669, -66.97594958444186, 25562969, "1122334455", 27, 'app/assets/images/perfiles/Perfil_Andres.jpg')
creacion_doctor("Pediatria", "6460253")

#Creación de los blogs
blog1 = Blog.create!(
  comment: "La práctica médica es un campo complejo que presenta una serie de desafíos éticos que los profesionales de la salud deben enfrentar día a día. Estos desafíos éticos abarcan una amplia gama de cuestiones, desde la confidencialidad del paciente hasta la toma de decisiones al final de la vida, y son fundamentales para garantizar la integridad y la calidad de la atención médica.",
  title: "Ética en medicina: Desafíos y soluciones",
  user_id: User.first.id
)

blog1.photo.attach(io: File.open('app/assets/images/blogs/Desafios_eticos.jpg'), filename: 'Desafios_eticos.jpg', content_type: 'image/jpeg')

puts "Blog 1 creado correctamente"

blog2 = Blog.create!(
  comment: "Un término que antes parecía pertenecer a un futuro distante, se ha convertido en una realidad tangible que está revolucionando la forma en que recibimos atención médica en la era digital.",
  title: "Telemedicina: atención en la era digital",
  user_id: User.second.id
)

blog2.photo.attach(io: File.open('app/assets/images/blogs/Telemedicina.jpg'), filename: 'Telemedicina.jpg', content_type: 'image/jpeg')

puts "Blog 2 creado correctamente"

blog3 = Blog.create!(
  comment: "La pandemia de COVID-19 ha tenido un impacto profundo en la salud mental y el bienestar emocional tanto de los pacientes como de los profesionales de la salud en todo el mundo. Desde el inicio de la pandemia, hemos sido testigos de una amplia gama de respuestas psicológicas, que van desde el estrés y la ansiedad hasta la depresión y el trauma, tanto en aquellos que han contraído el virus como en aquellos que han sido afectados de otras maneras por sus ramificaciones.",
  title: "Impacto psicológico de COVID-19",
  user_id: User.third.id
)

blog3.photo.attach(io: File.open('app/assets/images/blogs/COVID.jpg'), filename: 'COVID.jpg', content_type: 'image/jpeg')

puts "Blog 3 creado correctamente"

blog4 = Blog.create!(
  comment: "La salud mental es un componente fundamental de la atención médica integral que no debe pasarse por alto. Si bien tradicionalmente se ha prestado más atención a las enfermedades físicas, cada vez más se reconoce que la salud mental desempeña un papel crucial en el bienestar general de un individuo.",
  title: "Importancia de la salud mental",
  user_id: User.last.id
)

blog4.photo.attach(io: File.open('app/assets/images/blogs/Salud_Mental.jpg'), filename: 'Salud_Mental.jpg', content_type: 'image/jpeg')

puts "Blog 4 creado correctamente"

def creacion_consultations(diagnostic)
  consultation = Consultation.new(
    diagnostic: diagnostic,
    patient_id: Patient.pluck(:id).sample,
    doctor_id: Doctor.pluck(:id).sample
  )

  if consultation.save
    puts "¡Diagnóstico creado exitosamente!"
  else
    puts "¡Error al crear el diagnóstico!"
  end

  # rails console
  Flat.create(address: "16 Villa Gaudelet, Paris", name: "Le Wagon HQ")
  # rails console
  Flat.near("Tour Eiffel", 10)   # flats within 10 km of Tour Eiffel
  Flat.near([40.71, 100.23], 20) # flats within 20 km of a point
end

creacion_consultations("La lesión en el tobillo derecho es un problema común que puede ocurrir debido a una variedad de razones, como torceduras, esguinces, fracturas o tensiones. Puede afectar a personas de todas las edades y niveles de actividad física.")
creacion_consultations("El dolor abdominal de origen desconocido es un síntoma que puede presentarse por una variedad de razones y puede afectar a personas de todas las edades y géneros. Este tipo de dolor puede manifestarse de diferentes formas, como calambres, punzadas o sensaciones de presión en el área abdominal.")
creacion_consultations("La hipertensión arterial controlada es una condición médica en la que la presión arterial se mantiene dentro de los límites normales mediante la implementación de cambios en el estilo de vida y, en algunos casos, el uso de medicamentos recetados.")
creacion_consultations("El esguince cervical moderado es una lesión en los tejidos blandos del cuello, causada comúnmente por una fuerza brusca o un movimiento repentino de la cabeza hacia atrás, adelante o de lado a lado.")
creacion_consultations("La bronquitis aguda es una inflamación de los bronquios, los conductos que llevan el aire hacia los pulmones. Esta afección suele ser causada por virus respiratorios, como el virus de la gripe o el virus sincitial respiratorio")
