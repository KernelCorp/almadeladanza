#encoding: utf-8
class ClientMailer < ActionMailer::Base
  default from: "site@almadeladanza.ru"

  def client_reg_email(client)
    @client = client
    mail to: 'admin@almadeladanza.ru',
         subject: 'Новый клиент'
  end

end
