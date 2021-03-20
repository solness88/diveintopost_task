class DeleteMailer < ApplicationMailer
  def delete_mail(destroy_agenda)
    @destroy_agenda = destroy_agenda
    agenda_users = Team.find(@destroy_agenda.team_id).assign_users
    mail(
      to: agenda_users.pluck(:email),
      subject: "アジェンダ削除"
    )
  end
end
