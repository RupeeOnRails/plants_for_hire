secret=$(rails secret)
export SECRET_KEY_BASE=$secret
rails db:migrate RAILS_ENV=production
rails assets:precompile RAILS_ENV=production
rails s -e production -p 3001
