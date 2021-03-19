class DeleteMailer < ApplicationMailer
  def delete_mail(destroy_agenda)
    @destroy_agenda = destroy_agenda
    mail to: "@agenda_user_email", subject: "アジェンダ削除"
  end
end
