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

sleep 5000