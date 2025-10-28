# Fastlane Configuration for Home4U

This directory contains Fastlane configuration for automating Android builds and deployments.

## Files Overview

- **Fastfile**: Contains lane definitions for various deployment tasks
- **Appfile**: Contains app identifiers and credentials
- **Pluginfile**: Lists Fastlane plugins used in this project
- **Gemfile**: Ruby dependencies (in parent android directory)

## Prerequisites

1. **Ruby**: Ensure Ruby is installed
   ```bash
   ruby --version
   ```

2. **Bundler**: Install Bundler gem
   ```bash
   gem install bundler
   ```

3. **Install Dependencies**:
   ```bash
   cd android
   bundle install
   ```

## Available Lanes

### 🔥 Firebase Distribution Lane

Builds and distributes APK to Firebase App Distribution.

**Usage:**
```bash
cd android
bundle exec fastlane firebase_distribution
```

**What it does:**
1. Cleans the Flutter project using FVM
2. Builds production release APK
3. Uploads APK to Firebase App Distribution
4. Notifies testers via email

**Current Testers:**
- attia3104@gmail.com
- yousefshwaly@gmail.com

## Environment Variables

Create a `.env` file in the `android/fastlane/` directory:

```env
# Firebase CLI Token (get via: firebase login:ci)
FIREBASE_CLI_TOKEN=your_token_here

# Optional: Add more environment variables as needed
KEYSTORE_PASSWORD=your_keystore_password
KEY_ALIAS=your_key_alias
KEY_PASSWORD=your_key_password
```

### Getting Firebase CLI Token

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login and get token
firebase login:ci
```

Copy the token and add it to your `.env` file.

## Plugins Used

### firebase_app_distribution
Uploads builds to Firebase App Distribution and notifies testers.

**Installation:**
```bash
bundle exec fastlane add_plugin firebase_app_distribution
```

## Adding New Lanes

### Example: Deploy to Google Play Store

Add to `Fastfile`:

```ruby
lane :deploy_playstore do
  sh "fvm flutter clean"
  sh "fvm flutter build appbundle --release --flavor production --target lib/main_production.dart"
  
  upload_to_play_store(
    track: 'internal',
    aab: '../build/app/outputs/bundle/productionRelease/app-production-release.aab',
    skip_upload_metadata: true,
    skip_upload_images: true,
    skip_upload_screenshots: true
  )
end
```

**Usage:**
```bash
bundle exec fastlane deploy_playstore
```

### Example: Beta Testing Lane

```ruby
lane :beta do
  sh "fvm flutter clean"
  sh "fvm flutter build apk --release --flavor development --target lib/main_development.dart"
  
  firebase_app_distribution(
    app: "1:409187249081:android:dc6937373a8475d154e468",
    firebase_cli_token: ENV["FIREBASE_CLI_TOKEN"],
    android_artifact_type: "APK",
    android_artifact_path: "../build/app/outputs/flutter-apk/app-development-release.apk",
    testers: "team@example.com",
    release_notes: "Beta build for internal testing"
  )
end
```

## Troubleshooting

### Permission Denied
```bash
cd android
chmod +x gradlew
bundle exec fastlane firebase_distribution
```

### Firebase Token Expired
```bash
firebase login:ci
# Update FIREBASE_CLI_TOKEN in .env file
```

### Bundle Install Fails
```bash
# Update Bundler
gem update bundler

# Clean and reinstall
rm -rf vendor/bundle
bundle install
```

### Build Fails
```bash
# Clean Flutter project
fvm flutter clean

# Get dependencies
fvm flutter pub get

# Try again
bundle exec fastlane firebase_distribution
```

## CI/CD Integration

### GitHub Actions Example

```yaml
- name: Deploy to Firebase
  run: |
    cd android
    echo "${{ secrets.FIREBASE_CLI_TOKEN }}" > fastlane/.env
    bundle install
    bundle exec fastlane firebase_distribution
```

### GitLab CI Example

```yaml
deploy_firebase:
  script:
    - cd android
    - echo "FIREBASE_CLI_TOKEN=$FIREBASE_CLI_TOKEN" > fastlane/.env
    - bundle install
    - bundle exec fastlane firebase_distribution
```

## Best Practices

✅ **Use FVM**: Ensure consistent Flutter version across builds
✅ **Environment Variables**: Never commit tokens to version control
✅ **Test Locally**: Test lanes locally before pushing to CI/CD
✅ **Version Control**: Commit Fastfile, Appfile, and Pluginfile
✅ **Documentation**: Document custom lanes and their purpose
✅ **Error Handling**: Add error handling in custom lanes

## Useful Commands

```bash
# List all available lanes
bundle exec fastlane lanes

# Update Fastlane
bundle update fastlane

# Update plugins
bundle exec fastlane update_plugins

# Test a lane
bundle exec fastlane [lane_name] --verbose

# Clean Fastlane cache
bundle exec fastlane run clear_derived_data
```

## Resources

- [Fastlane Documentation](https://docs.fastlane.tools/)
- [Firebase App Distribution Plugin](https://firebase.google.com/docs/app-distribution/android/distribute-fastlane)
- [Flutter + Fastlane Guide](https://docs.flutter.dev/deployment/cd#fastlane)

---

For questions or issues, contact the development team.

