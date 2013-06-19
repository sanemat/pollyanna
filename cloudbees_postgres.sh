######### POSTGRES INSTAL(first time) AND LAUNCH #########
curl -s -o use-postgresql https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/postgresql/use-postgresql
source ./use-postgresql

######### DESTROY DATABASES AND USERS #########
psql -d postgres -c "DROP DATABASE IF EXISTS ${DATABASE};"
psql -d postgres -c "DROP USER IF EXISTS ${USERNAME};"

######### REPOPULATE SERVER WITH DATABASE AND USER FOR TEST #########
psql -d postgres -c "CREATE USER ${USERNAME} WITH CREATEDB;"
psql -d postgres -c "ALTER USER ${USERNAME} PASSWORD '${PASSWORD}';"
psql -d postgres -c "CREATE DATABASE ${DATABASE} OWNER ${USERNAME};"


######### THIS CODE NOW EXITS. #########
## If you have other 'M2 PreBuild' steps following this
## in your configuration, they will now execute
##
## Eventually, control is given to the main build and
## the PostgreSQL server will still be running, ready
## to use!
