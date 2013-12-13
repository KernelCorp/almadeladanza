class ClientsController < ApplicationController

  def create
    @client = Client.new(params[:client])
    @client.save!
    ClientMailer.client_reg_email(@client).deliver
    head :ok
  end

end
