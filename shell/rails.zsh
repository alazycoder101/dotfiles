alias br='bin/rails'
alias be='bundle exec'
alias brdm='bin/rails db:migrate RAILS_ENV=development && bin/rails db:migrate RAILS_ENV=test'
alias brdrol='bin/rails db:rollback STEP=1 && bin/rails db:rollback STEP=1 RAILS_ENV=test'
alias bi='bundle install'
alias ees="export EDITOR='subl -w'"
alias bd="./bin/dev"
alias brdcm="br db:drop db:create db:migrate"
alias brdcms="br db:drop db:create db:migrate db:seed"
alias rcr="bin/rails cypress:run"
alias rco="bin/rails cypress:open"
alias resetdbtest='bin/rails db:drop db:create db:migrate RAILS_ENV=test'
alias resetdbdev='bin/rails db:drop db:create db:migrate RAILS_ENV=development'
alias brg='bin/rails generate'
alias brt='bin/rails test'
alias fd="foreman start -f Procfile.dev"
