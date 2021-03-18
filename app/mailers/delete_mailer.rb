class DeleteMailer < ApplicationMailer
  def delete_mail()
    #@destroy_agenda
    mail to: "@agenda_user_email", subject: "お問い合わせの確認メール"
  end
end
