#encoding: utf-8
class ChangeAttributesInContacts < ActiveRecord::Migration
  def change
    contacts = Contact.all.first
    if contacts
      contacts.update_attributes phone: '8 (383) 202-23-79', email: 'dance@almadeladanza.ru', address: 'Новосибирск, ул. Ленина 48'
    end
  end
end
