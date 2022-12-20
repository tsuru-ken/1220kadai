class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post
    @user = post.user


    mail to: @user.email, subject: "お問い合わせの確認メール"
  end
end
