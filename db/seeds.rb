
c = Clinic.create(label: "Ambulatoriya Simeynoyi Medetsyny",
                  tooltip: "Lubinska St, 56",
                  city: 'Lviv',
                  latitude: 0.4982706943977465e2,
                  longitude: 0.2398066080988691e2)

Clinic.create(label: "Family medical clinic",
              tooltip: "Yakova Rappaporta Ya. St, 6",
              city: 'Lviv',
              latitude: 0.498442929e2,
              longitude: 0.240161279e2)

Clinic.create(label: "Ambulatoriya Simeynoyi Medytsyny",
              tooltip: "Tatarska St, 1",
              city: 'Kyiv',
              latitude: 50.4638399,
              longitude: 30.4861128)
Clinic.create(label: "Yuliya, Ambulatoriya Simeynoyi Medytsyny",
              tooltip: "Osinnya St, 33",
              city: 'Kyiv',
              latitude: 50.3409945,
              longitude: 30.9694451)

15.times do
  User.create(
    email: FFaker::Internet.email,
    password: 'password',
    first_name: FFaker::NameUA.first_name,
    last_name: FFaker::NameUA.last_name,
    phone: FFaker::PhoneNumberUA.home_phone_number,
    birthday: DateTime.current - rand(18..60).years,
    clinic_id: c.id)
end
