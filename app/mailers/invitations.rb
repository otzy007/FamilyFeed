class Invitations < ActionMailer::Base
  default from: "familyfeed@cloudients.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitations.invite.subject
  #
  def invite(name, email, token, to)
     @name = name
     @token = token
     mail to: to, subject: "#{email} invited you to his FamilyFeed"
  end
end
