set :ip, "18.236.147.83"
# set :ip, "35.160.119.161" 
set :rails_env, 'production'
server "#{ip}", :web, :app, :db, primary: true,
  ssh_options: {
     keys: %w(/Users/osvaldo/.ssh/id_rsa),
     forward_agent: true,
     auth_methods: %w(publickey)
  }