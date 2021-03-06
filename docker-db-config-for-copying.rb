# default: &default
#   adapter: postgresql
#   encoding: unicode
#   port: 5432
#   host: pg
#   pool: 5
#   timeout: 5000

# #This setup works for me running rails on docker. Basically need to specify a URL so you'll use a .env file to specify the postgres url and you'll change between _development _test and _production using your config/database file just make you add the env. file to your web service docker-compose file:

# /docker-compose.yml:

# services:
#   postgres:
#     image: postgres:9.6
#     restart: always
#     environment:
#       POSTGRES_USER: roomies-be #DockerHub postgres docs state this is optional but must be used when password is set.  It will also create a db under the supplied username which you'll use to connect to in rails console such as: $docker-compose exec postgres psql -U YourUserNameHere
#       POSTGRES_PASSWORD: 'whateverPWYouWant'
#     ports:
#       - '5432' #Was originally 5432:5432 with the Left hand side being port on host machine, right hand side is the port on the docker container.  However I let docker choose the port it will use by supplying because 5432 is running on my local for other projects.  
#     volumes:
#       - postgres:/var/lib/postgresql/data 



#   web:
#     build: . #Runs the docker build command on the current directory
#     links: #Links the listed services to our application so containers can talk to eachother
#       - postgres
#     restart: always
#     volumes:
#       - .:/postgres:/var/lib/postgresql/data  #Left hand side is current directory of compose file, right hand side is container folder.  This needs to be same as Install_path folder in Dockerfile.
#     ports:
#       - '8000:8000' #Left is the local port and the right side is the container port
#     env_file:
#       - .roomies-be.env #This should be in your root project directory along side the Dockerfile and docker-compose file
#     depends_on:
#       - 'redis'
#       - 'postgres'

# # development:
# #   url: <%= ENV['DATABASE_URL'].gsub('?', '_development?' ) %>
# # test:
# #   url: <%= ENV['DATABASE_URL'].gsub('?', '_test?' ) %>
# # production:
# #   url: <%= ENV['DATABASE_URL'].gsub('?', '_production?' ) %>


# PostgreSQL. Versions 9.1 and up are supported.
#
# Install the pg driver:
#   gem install pg
# On OS X with Homebrew:
#   gem install pg -- --with-pg-config=/usr/local/bin/pg_config
# On OS X with MacPorts:
#   gem install pg -- --with-pg-config=/opt/local/lib/postgresql84/bin/pg_config
# On Windows:
#   gem install pg
#       Choose the win32 build.
#       Install PostgreSQL and put its /bin directory on your path.
#
# Configure Using Gemfile
# gem 'pg'
#