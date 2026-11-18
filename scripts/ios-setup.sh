#!/usr/bin/env bash
# Makes the iPhone project (ios/) and puts in the Rise Rival icon, splash and permission wording.
# Codemagic runs this on its Mac. Safe to run again.
set -euo pipefail
cd "$(dirname "$0")/.."
[ -d ios ] || npx cap add ios
npx cap sync ios
P=ios/App/App/Info.plist
pb() { /usr/libexec/PlistBuddy -c "Delete :$1" "$P" 2>/dev/null || true; /usr/libexec/PlistBuddy -c "Add :$1 $2 $3" "$P"; }
pb NSCameraUsageDescription string "Rise Rival opens the camera so you can snap your sink to prove you are up. The photo is not kept."
pb NSMotionUsageDescription string "Rise Rival counts 20 steps to prove you are up, if you pick steps."
pb ITSAppUsesNonExemptEncryption bool false
pb UIRequiresFullScreen bool true
# the icon: one 1024 picture, iOS makes every size from it
IC=$(find ios/App/App/Assets.xcassets/AppIcon.appiconset -name "*.png" | head -1)
cp assets/icon-1024.png "$IC"
# the launch screen: plain white, or plain black in dark mode; the Rise Rival start screen draws itself in right after.
SP=ios/App/App/Assets.xcassets/Splash.imageset; rm -f "$SP"/*.png; cp assets/splash-light.png "$SP/splash-light.png"; cp assets/splash-dark.png "$SP/splash-dark.png"; cp assets/splash-Contents.json "$SP/Contents.json"
# the build number goes up by one each Codemagic build
if [ -n "${BUILD_NUMBER:-}" ]; then sed -i "" -E "s/CURRENT_PROJECT_VERSION = [0-9]+;/CURRENT_PROJECT_VERSION = ${BUILD_NUMBER};/g" ios/App/App.xcodeproj/project.pbxproj; fi
echo "iPhone project ready: ${PWD}/ios"
