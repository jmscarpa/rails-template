environment "config.to_prepare do
  Devise::SessionsController.layout 'sessions'
  Devise::PasswordsController.layout 'sessions'
  Devise::RegistrationsController.layout 'sessions'
  Devise::Mailer.layout 'mailer'
end\n"
