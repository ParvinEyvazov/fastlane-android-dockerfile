echo "Cloning"

git clone $REPOSITORY_URL

cd $REPOSITORY_NAME

echo "Clone Operation was successful"


mkdir fastlane
cd fastlane

cp /build/repos/Fastfile Fastfile

cd ..

chmod +x gradlew

fastlane build

curl -X POST curl -X POST https://tdgames-8cd80.hq.spicaengine.com/api/fn-execute/storageMaster -H "Content-Type: application/json" --data {\"content\":\"$(echo 'test' | base64)\"} -H "Content-Type: application/json" --data {\"content\":\"$(echo 'test' | base64)\"}

sleep 5000