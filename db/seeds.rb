
Treatment.destroy_all
Appointment.destroy_all
Prescription.destroy_all
MedicalRecord.destroy_all
Symptom.destroy_all
Drug.destroy_all
MedicalProfessional.destroy_all

# Seeds for MedicalRecord

puts 'Creating medical records...'
  medical_record_1 = MedicalRecord.new(
    record_date: DateTime.new(2017,9,14,8),
    title: "record 1",
    category: "Opération",
    user_id: "1"
  )
  medical_record_1.save!

  medical_record_2 = MedicalRecord.new(
    record_date: DateTime.new(2017,10,14,8),
    title: "record 2",
    category: "Antécédent Familial",
    user_id: "1"
  )
  medical_record_2.save!

  medical_record_3 = MedicalRecord.new(
    record_date: DateTime.new(2017,11,14,8),
    title: "record 3",
    category: "Prise de Sang",
    user_id: "1"
  )
  medical_record_3.save!

  medical_record_4 = MedicalRecord.new(
    record_date: DateTime.new(2017,12,14,8),
    title: "record 4",
    category: "Autre",
    user_id: "1"
  )
  medical_record_4.save!
puts 'Finished!'

# Seeds for Medical Professionals

puts 'Creating Medical Professionals...'
  medical_professionals_1 = MedicalProfessional.new(
    location_name: "Hôpital Ambroise Paré",
    address: "9 avenue Charles-de-Gaulle",
    phone: "0808080808",
    specialty: "Cardiologie",
    doctor: "Docteur",
    email: "docteur@gmail.com"
  )
  medical_professionals_1.save!

puts 'Creating Medical Professionals...'
  medical_professionals_2 = MedicalProfessional.new(
    location_name: "Cabinet médical",
    address: "9 avenue Charles-de-Gaulle",
    phone: "0808080808",
    specialty: "Cardiologie",
    doctor: "Docteur",
    email: "docteur@gmail.com"
  )
  medical_professionals_2.save!

  puts 'Creating Medical Professionals...'
  medical_professionals_3 = MedicalProfessional.new(
    location_name: "Hôpital Ambroise Paré",
    address: "9 avenue Charles-de-Gaulle",
    phone: "0808080808",
    specialty: "Cardiologie",
    doctor: "Docteur",
    email: "docteur@gmail.com"
  )
  medical_professionals_3.save!

  puts 'Creating Medical Professionals...'
  medical_professionals_4 = MedicalProfessional.new(
    location_name: "Centre de radiologie",
    address: "9 avenue Charles-de-Gaulle",
    phone: "0808080808",
    specialty: "Cardiologie",
    doctor: "Docteur",
    email: "docteur@gmail.com"
  )
  medical_professionals_4.save!
puts "Finished!"

# Seeds for symptoms
puts 'Creating Symptoms'
  symptom_1 = Symptom.new(
  name: "Migraine",
  intensity: "4",
  start_date: DateTime.new(2018,5,12,9),
  end_date: DateTime.new(2018,5,12,16),
  description: "Douleur pontuelle",
  user_id: "1"
  )
symptom_1.save!

  symptom_2 = Symptom.new(
  name: "Migraine",
  intensity: "4",
  start_date: DateTime.new(2018,5,17,12),
  end_date: DateTime.new(2018,5,17,14),
  description: "Douleur pontuelle",
  user_id: "1"
  )
symptom_2.save!

 symptom_3 = Symptom.new(
  name: "Migraine",
  intensity: "4",
  start_date: DateTime.new(2018,5,20,12),
  end_date: DateTime.new(2018,5,20,14),
  description: "Douleur pontuelle",
  user_id: "1"
  )
symptom_3.save!

symptom_4 = Symptom.new(
  name: "Migraine",
  intensity: "4",
  start_date: DateTime.new(2018,5,24,5),
  end_date: DateTime.new(2018,5,24,9),
  description: "Douleur pontuelle",
  user_id: "1"
  )
symptom_4.save!

puts 'Finished'

# Seeds for Drugs

puts 'Creating Drugs ...'
  drug_1 = Drug.new(
  name: "Doliprane",
  category: "Anti Migraine",
  description: "Soigne les migraines"
  )
drug_1.save!

drug_2 = Drug.new(
  name: "Smecta",
  category: "Anti Migraine",
  description: "Soigne les migraines"
  )
drug_2.save!

drug_3 = Drug.new(
  name: "Ibuprofene",
  category: "Anti Migraine",
  description: "Soigne les migraines"
  )
drug_3.save!

drug_4 = Drug.new(
  name: "Immodium",
  category: "Anti Migraine",
  description: "Soigne les migraines"
  )
drug_4.save!
puts 'Finished!'

# Seeds for Appointments

puts 'Creating Appointments...'

20.times do
  month = rand(1..12)
  day = rand(1..28)
  start_time = rand(8..17)
  end_time = start_time + rand(1..3)
  Appointment.create!(
    start_date: DateTime.new(2018,month,day, start_time),
    end_date: DateTime.new(2018,month,day, end_time),
    category: ["Imagerie", "Médecin", "Kinésithérapie"].sample,
    description: "Important",
    user_id: 1,
    medical_professional_id: MedicalProfessional.ids.sample
  )
end

puts 'Finished!'


# Seeds for Prescription and treatment

puts "Creating Prescription and Treatments"
20.times do

  poso = {
    take_time: [8, 12, 16, 20].sample,
    quantity: rand(1..3)
  }

  m1 = rand(1..7)
  m2 = m1 + rand(1..5)
  new_prescription = Prescription.create!(
    start_date: DateTime.new(2018,m1,rand(1..28)),
    end_date: DateTime.new(2018,m2,rand(1..28)),
    medical_professional_id: MedicalProfessional.ids.sample
)
  puts new_prescription.end_date
  puts new_prescription.start_date
  puts days_number = (new_prescription.end_date - new_prescription.start_date).to_i
  days_number.times do |i|
    Treatment.create!(
      prescription_id: new_prescription.id,
      drug_id: Drug.ids.sample,
      taken: false,
      take_time: new_prescription.start_date + i - 1 + poso[:take_time].to_f / 24,
      quantity: poso[:quantity],
      user_id: 1
      )
  end
end

puts "Finished!"
















