ActiveAdmin.register Booking do
  permit_params :start_time, :end_time, :service_id, :intake_forms, :online, :status, :duration, :doctor_id, :patient_id,
                :doctor_accepted, :patient_accepted, :clinic_id
end
