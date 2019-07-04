bullet_init = <<-RUBY
config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.airbrake = true
    Bullet.add_footer = true
  end
RUBY
application bullet_init, :env => 'development'

