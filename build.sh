echo "CLONNING!"

git clone $REPOSITORY_URL

cd $REPOSITORY_NAME

echo "CLONE OPERATION WAS SUCCESSFUL!"


mkdir fastlane
cd fastlane

cp /build/repos/Fastfile Fastfile

cd ..

chmod +x gradlew

curl -X POST https://tdgames-8cd80.hq.spicaengine.com/api/fn-execute/storageMaster -H "Content-Type: application/json" --data {\"content\":\"$(echo 'start building' | base64)\"}


fastlane build

echo "SUCCESSFULLY BUILD!"

curl -X POST https://tdgames-8cd80.hq.spicaengine.com/api/fn-execute/storageMaster -H "Content-Type: application/json" --data {\"content\":\"$(echo 'end of building' | base64)\"}

echo "SENDED POST REQUEST"