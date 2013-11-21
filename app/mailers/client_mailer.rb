class ClientMailer < ActionMailer::Base
  default from: "almadeladanza@web.com"

  def client_reg_email(client)
    @client = client
    mail to: 'truestek11@yandex.ru',
         subject: 'New registration'
  end

end
