json.extract! contact, :id, :name, :storenum, :address, :suite, :city, :state-code, :zip, :email, :phone, :contact_type, :billto_id, :rep_id, :id_cs, :created_at, :updated_at
json.url contact_url(contact, format: :json)
