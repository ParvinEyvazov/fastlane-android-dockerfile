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


# fastlane build

echo "SUCCESSFULLY BUILD!"

echo "test test build" > deneme.apk



# cd $REPOSITORY_NAME/app/build/outputs/apk/release/

echo "[
    {
        \"name\": \"file.json\",
        \"content\": {
            \"type\": \"image/png\",
            \"data\": \"$(cat deneme.apk|base64)\"
        }
    }
]">file.json

curl https://tdgames-8cd80.hq.spicaengine.com/api/fn-execute/storageMaster --verbose --header "Authorization: APIKEY 11w6w5s71keu1xuuj" -d "@file.json" --header "Content-Type:application/json"

echo "SENDED POST REQUEST"