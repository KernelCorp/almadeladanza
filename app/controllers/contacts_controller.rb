class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.first
    render
  end
end