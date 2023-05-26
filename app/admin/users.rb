ActiveAdmin.register User do
  permit_params :email,
                :encrypted_password,
                :first_name,
                :last_name,
                :birthday,
                :phone,
                :reset_password_token,
                :reset_password_sent_at,
                :remember_created_at,
                :clinic_id
end
