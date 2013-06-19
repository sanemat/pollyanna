BUNDLE_DATETIME=$(head -n 1 ./bundle_datetime.txt)

#https://gist.github.com/kyanny/4017686
RESULT=`curl ${BUILD_URL}api/xml | perl -le '$_=<>;/<result>(.+?)</;printf $1'`
# http://stackoverflow.com/questions/14863609/bash-a-multiword-variable-breaking-curl
curl -v \
  -H "Accept: application/json" \
  -H "Content-type: application/json" \
  -H "Authorization: token ${GH_TOKEN}" \
  -H "User-Agent: Bot-Motoko" \
  -X POST \
  -d@- \
  "https://api.github.com/repos/sanemat/pollyanna/pulls" <<EOF
  {
    "title": "Bundle $BUNDLE_DATETIME",
    "body": ":hamster::hamster::hamster:",
    "head": "bot-motoko:feature/bundle-update-$BUNDLE_DATETIME",
    "base": "master"
   }
EOF
