set :ip, "35.167.207.47"
# set :ip, "35.160.119.161" 
set :rails_env, 'production'
server "#{ip}", :web, :app, :db, primary: true,
  ssh_options: {
     keys: %w(/Users/osvaldo/.ssh/id_rsa),
     forward_agent: true,
     auth_methods: %w(publickey)
  }