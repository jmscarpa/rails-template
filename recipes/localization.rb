inside 'config/locales' do
  remove_file 'en.yml'
  create_file 'pt-BR.yml', '"pt-BR:"'
end

environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'
environment " config.time_zone = 'Brasilia' "
environment "config.i18n.default_locale = :'pt-BR'"

