say "Copying Gemfile", :blue
system 'rm Gemfile'
remote_template 'Gemfile', 'Gemfile'

say "Copying gitignore", :blue
system 'rm .gitignore'
remote_template 'gitignore', '.gitignore'

say "Installing gems", :blue
system 'bundle install'
system 'git init'

remove_file 'public/index.html'
remove_file 'app/assets/images/rails.png'

remote_template('generators.rb', 'config/initializers/generators.rb')
