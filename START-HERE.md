# Rise Rival - the iPhone app · RI001

This folder is the iPhone wrapper for **riserival.netlify.app**. The app opens the live site inside a real iPhone app,
so every website update shows up in the app with no new build. The alarm only works in the iPhone app.

- App name: **Rise Rival**
- Bundle ID: **com.riserival.app**  (if Apple says it's taken, change it in `capacitor.config.json` AND `codemagic.yaml`)

## First: the website
1. Netlify > Add new site > Deploy manually > drag **RiseRival-RI001-netlify.zip**.
2. Site settings > Change site name > **riserival** (so the address is riserival.netlify.app - the iPhone app opens that address).
3. Supabase (the Club project) > SQL Editor > paste **RI001-RISE.sql** > Run. (Lets Rise Rival send XP to Club Rival.)

## Get it on TestFlight (same steps as Money Rival)
1. **developer.apple.com > Identifiers > +** > App IDs > App. Description `Rise Rival`, Bundle ID Explicit `com.riserival.app`. Register.
2. **appstoreconnect.apple.com > Apps > +** > New App. iOS, name `Rise Rival`, English, bundle ID `com.riserival.app`, SKU `rise-rival`.
3. **GitHub:** New repository `rise-rival-ios`, Private. Upload everything in this folder. Commit.
4. **Codemagic:** Add application > `rise-rival-ios`. It finds `codemagic.yaml` by itself.
5. **Signing:** Codemagic > the app > Code signing > iOS > pick the App Store profile for `com.riserival.app`.
6. **Build:** Start new build > workflow `Rise Rival - iPhone`. 15-25 minutes. Green = it's on TestFlight.
7. **Phone:** App Store Connect > Rise Rival > TestFlight > add yourself. Install from the TestFlight app.

## Check it
1. Open Rise Rival. Set your wake time, pick PHOTO, tap START. Allow notifications when it asks.
2. Set the wake time 2 minutes from now (Plan). Lock the phone. It rings, then nudges every 3 minutes.
3. Tap the alert > I'M UP > SNAP YOUR SINK. The nudges stop. Rate how rested you feel, check off your first hour.

## Honest limits
- The alarm is a notification: it follows the ringer switch, volume and Focus. Keep the ringer on for Rise Rival.
- The light-sleep wake window comes through Rest Rival's night screen next (it is the app listening all night).
