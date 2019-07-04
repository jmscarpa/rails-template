remote_template('database.yml.sample', 'config/database.yml.sample')
system 'cp config/database.yml.sample config/database.yml'

say " === Dropping database if exists ===", :red
system 'rake db:drop db:create'
system 'rake db:migrate db:setup'

empty_directory 'db/seeds'
system 'touch db/seeds/.gitkeep'