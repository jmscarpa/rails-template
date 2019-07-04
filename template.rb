require "shellwords"
require 'open-uri'

def remote_template(source, destination = source, config = {})
  if ENV['LOCAL']
    source  = File.expand_path(File.dirname(__FILE__)) + "/templates/#{source}"
  else
    source = "https://raw.github.com/jmscarpa/rails-template/master/templates/#{source}"
  end
  context = instance_eval('binding')

  create_file destination, nil, config do
    ERB.new(open(source).read, nil, '-').result(context)
  end
end

def recipe(source)
  say "Trying recipe #{source} \n", :blue
  source = "https://raw.github.com/jmscarpa/rails-template/master/recipes/#{source}.rb"
  source  = File.expand_path(File.dirname(__FILE__)) + "/recipes/#{source}.rb" if ENV['LOCAL']
  say "Downloading from  #{source}", :blue


  apply source
end

def commit(description)
  say "Committing #{description}"
  system 'git add .'
  system 'git add --update .'
  system "git commit -am '#{description}'"
end

say "Starting...", :blue

%w(
  after_init
  db
  localization
  assets
  procfile
  bullet
  simple_form
).each do |r|
  recipe r
end

generate(:controller, "home index --no-assets --no-helper --skip-routes")
route "root to: 'home#index'"

commit 'App Base'
