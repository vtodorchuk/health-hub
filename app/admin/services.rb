ActiveAdmin.register Service do
  permit_params :user_id, :name, :description, :clinic_id
end
