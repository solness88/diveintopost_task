class DeleteMailer < ApplicationMailer
  def delete_mail(contact)
    @delete = delete
    mail to: "自分のメールアドレス", subject: "お問い合わせの確認メール"
  end
end
