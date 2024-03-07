Blog.destroy_all
History.destroy_all
User.destroy_all

alvaro = User.create!(
  email: "alvarorg2111@gmail.com",
  password: "12345678",
  role: "patient",
  first_name: "Alvaro",
  last_name: "Raga",
  age: 22,
  dni: 28154771,
  number_phone: "1234567890",
)
alvaro.photo.attach(io: File.open('app/assets/images/perfiles/Perfil_Alvaro.jpg'), filename: 'Perfil_Alvaro.jpg', content_type: 'image/jpeg')

gabriel = User.create!(
  email: "alberto.manrique99@gmail.com",
  password: "12345678",
  role: "patient",
  first_name: "Gabriel",
  last_name: "Manrique",
  age: 25,
  dni: 26921249,
  number_phone: "04140176629",
)
alvaro.photo.attach(io: File.open('app/assets/images/perfiles/Perfil_Gabriel.jpg'), filename: 'Perfil_Gabriel.jpg', content_type: 'image/jpeg')


leonardo = User.create!(
  email: "leonardocabrices1@gmail.com",
  password: "12345678",
  role: "doctor",
  first_name: "Leonardo",
  last_name: "Parra",
  age: 25,
  dni: 26466787,
  sap: 34567890,
  number_phone: "0987654321",
  specialty: "Pediatra"
)
leonardo.photo.attach(io: File.open('app/assets/images/perfiles/Perfil_Leonardo.jpg'), filename: 'Perfil_Leonardo.jpg', content_type: 'image/jpeg')

andres = User.create!(
  email: "dragotorres16@gmail.com",
  password: "12345678",
  role: "doctor",
  first_name: "Andres",
  last_name: "Torres",
  age: 28,
  dni: 25562969,
  sap: 23456789,
  number_phone: "1122334455",
  specialty: "Cirugia"
)
leonardo.photo.attach(io: File.open('app/assets/images/perfiles/Perfil_Andres.jpg'), filename: 'Perfil_Andres.jpg', content_type: 'image/jpeg')
