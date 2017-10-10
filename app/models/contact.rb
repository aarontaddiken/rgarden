class Contact < ApplicationRecord
self.table_name = 'contact'
  belongs_to :billto, class_name: "Contact", foreign_key: :id
  belongs_to :rep
end
