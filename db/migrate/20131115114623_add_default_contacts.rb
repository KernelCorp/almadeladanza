#encoding: utf-8
class AddDefaultContacts < ActiveRecord::Migration
  def change
    Contact.create! phone: '8(383)2022379', email: 'dance@almadeladanza.ru', address: 'Новосибирск, ул. Ленина 18'
  end
end
