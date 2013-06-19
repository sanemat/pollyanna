source ./use-postgresql
source ./use-node
echo -n ${BUNDLE_DATETIME} > ./bundle_datetime.txt

gem install bundler
# unless git remote pushable exist
git remote add pushable https://${GH_TOKEN}@github.com/bot-motoko/pollyanna.git

#https://gist.github.com/kyanny/4017686
sed -i -e "s/ruby '2.0.0'/#ruby '2.0.0'/" Gemfile
bundle

git checkout -b feature/bundle-update-${BUNDLE_DATETIME}
bundle update

sed -i -e "s/#ruby '2.0.0'/ruby '2.0.0'/" Gemfile
git add Gemfile Gemfile.lock
git commit -m 'bundle update'
git push pushable feature/bundle-update-${BUNDLE_DATETIME}

sed -i -e "s/ruby '2.0.0'/#ruby '2.0.0'/" Gemfile
cp config/database.yml.example config/database.yml
bundle exec rake db:create db:schema:load
COVERAGE=on bundle exec rake spec
exitstatus=$?
bundle exec rake db:drop

git checkout master

exit $exitstatus
