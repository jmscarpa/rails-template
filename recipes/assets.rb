inside 'app/assets' do
  system 'rm javascripts/application.js'
  system 'rm stylesheets/application.css'
  remote_template 'application.js', 'javascripts/application.js'
  remote_template 'application.scss',  'stylesheets/application.scss'
  remote_template '_layout.scss',  'stylesheets/_layout.scss'
  remote_template '_variables.scss',  'stylesheets/_variables.scss'
end
