class OwnerMailer < ApplicationMailer
  def owner_mail(owner, team)
    @owner = owner
    @team = team
    mail to: @owner.email, subject: "チームリーダーの変更について"
  end
end
