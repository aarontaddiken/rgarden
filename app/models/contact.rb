class Contact < ApplicationRecord
self.table_name = 'contact'
  has_many :billtos, class_name: 'Contact', foreign_key: "billto_id"
  belongs_to :billto, class_name: "Contact"
  # belongs_to :rep
  has_many :products, foreign_key: 'company_id'
end
