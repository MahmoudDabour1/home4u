# Development Workflow Guide - Home4U Project

This guide outlines the recommended development workflow for the Home4U project, utilizing FVM, Fastlane, and GitHub Actions.

## 🚀 Initial Setup (One-time)

### 1. Clone Repository
```bash
git clone https://github.com/MahmoudDabour1/home4u.git
cd home4u
```

### 2. Install FVM
```bash
# macOS/Linux
brew tap leoafarias/fvm
brew install fvm

# Windows (PowerShell)
choco install fvm

# Or via Dart
dart pub global activate fvm
```

### 3. Setup Flutter with FVM
```bash
# Install Flutter 3.5.4
fvm install 3.5.4

# Use it for this project
fvm use 3.5.4

# Verify installation
fvm flutter --version
```

### 4. Install Dependencies
```bash
# Flutter dependencies
fvm flutter pub get

# Fastlane dependencies (for deployment)
cd android
bundle install
cd ..
```

### 5. Generate Code
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### 6. Configure IDE

**VS Code:**
Create `.vscode/settings.json`:
```json
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  "search.exclude": {
    "**/.fvm": true
  },
  "files.watcherExclude": {
    "**/.fvm": true
  }
}
```

**Android Studio:**
- Preferences > Languages & Frameworks > Flutter
- Set SDK path to: `[project_path]/.fvm/flutter_sdk`

## 💻 Daily Development Workflow

### 1. Pull Latest Changes
```bash
# Update main branch
git checkout main
git pull origin main

# Switch to your feature branch
git checkout feature/your-feature
git merge main
```

### 2. Run Development App
```bash
# Development flavor
fvm flutter run --flavor development -t lib/main_development.dart

# With specific device
fvm flutter run --flavor development -t lib/main_development.dart -d [device-id]

# List available devices
fvm flutter devices
```

### 3. Code Generation (When Needed)
```bash
# Watch mode (auto-regenerates on changes)
fvm flutter pub run build_runner watch --delete-conflicting-outputs

# One-time generation
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Pre-commit Checks
```bash
# 1. Format code
fvm flutter format .

# 2. Analyze code
fvm flutter analyze

# 3. Run tests
fvm flutter test

# 4. Check for issues
fvm flutter pub outdated
```

## 📦 Feature Development Workflow

### 1. Create Feature Branch
```bash
git checkout -b feature/feature-name
```

### 2. Develop Feature
- Write code following Clean Architecture principles
- Add unit tests for business logic
- Add widget tests for UI components
- Use BLoC pattern for state management

### 3. Test Thoroughly
```bash
# Run all tests
fvm flutter test

# Run specific test file
fvm flutter test test/features/your_feature/your_test.dart

# Run with coverage
fvm flutter test --coverage
```

### 4. Commit Changes
```bash
git add .
git commit -m "feat: add feature description"
```

**Commit Message Convention:**
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

### 5. Push and Create PR
```bash
git push origin feature/feature-name
```

Then create a Pull Request on GitHub.

## 🏗️ Building & Testing

### Development Build
```bash
# Android APK
fvm flutter build apk --debug --flavor development -t lib/main_development.dart

# iOS
fvm flutter build ios --debug --flavor development -t lib/main_development.dart
```

### Production Build
```bash
# Android APK
fvm flutter build apk --release --flavor production -t lib/main_production.dart

# Android App Bundle (for Play Store)
fvm flutter build appbundle --release --flavor production -t lib/main_production.dart

# iOS
fvm flutter build ios --release --flavor production -t lib/main_production.dart
```

## 🚀 Deployment Workflow

### Option 1: Manual Deployment via Fastlane
```bash
cd android
bundle exec fastlane firebase_distribution
cd ..
```

### Option 2: Automated Deployment via GitHub Actions

1. **Push to develop branch** (triggers testing):
   ```bash
   git checkout develop
   git merge feature/your-feature
   git push origin develop
   ```

2. **Push to main branch** (triggers testing + deployment):
   ```bash
   git checkout main
   git merge develop
   git push origin main
   ```

### Option 3: Shorebird OTA Update (Hot Fix)
```bash
# Create a patch without store approval
shorebird patch android --flavor production

# Check patch status
shorebird patch list
```

## 🔄 Release Workflow

### 1. Version Bump
Update version in `pubspec.yaml`:
```yaml
version: 1.0.9+1  # Increment version and build number
```

### 2. Update Changelog
Document changes in `CHANGELOG.md`:
```markdown
## [1.0.9] - 2025-10-28
### Added
- New feature description
### Fixed
- Bug fix description
```

### 3. Commit Version Bump
```bash
git add pubspec.yaml CHANGELOG.md
git commit -m "chore: bump version to 1.0.9"
git push origin main
```

### 4. Create Release Tag
```bash
git tag -a v1.0.9 -m "Version 1.0.9"
git push origin v1.0.9
```

### 5. Deploy
```bash
# Using Fastlane
cd android
bundle exec fastlane firebase_distribution

# Or using Shorebird for OTA
shorebird release android --flavor production
```

## 🐛 Debugging Workflow

### 1. Run in Debug Mode
```bash
fvm flutter run --debug --flavor development -t lib/main_development.dart
```

### 2. Use Flutter DevTools
```bash
# Open DevTools
fvm flutter pub global activate devtools
fvm flutter pub global run devtools
```

### 3. Check Logs
- Use `logger` package for structured logging
- Check console output for `pretty_dio_logger` network logs
- Use Flutter DevTools for performance profiling

### 4. Common Issues

**Build Fails:**
```bash
fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

**Dependency Conflicts:**
```bash
fvm flutter pub upgrade
```

**Gradle Issues:**
```bash
cd android
./gradlew clean
cd ..
fvm flutter clean
```

## 🧪 Testing Workflow

### Unit Tests
```bash
# Run all unit tests
fvm flutter test test/unit/

# Run with coverage
fvm flutter test --coverage
```

### Widget Tests
```bash
# Run widget tests
fvm flutter test test/widget/
```

### Integration Tests
```bash
# Run integration tests
fvm flutter test integration_test/
```

## 📊 Code Quality Workflow

### 1. Format Code
```bash
fvm flutter format .
```

### 2. Analyze Code
```bash
fvm flutter analyze
```

### 3. Check Coverage
```bash
fvm flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 🔧 Troubleshooting

### FVM Issues
```bash
# Reinstall Flutter version
fvm install 3.5.4 --force

# Clear FVM cache
rm -rf ~/.fvm/versions
fvm install 3.5.4
```

### Fastlane Issues
```bash
# Update Fastlane
cd android
bundle update fastlane

# Clear derived data
bundle exec fastlane run clear_derived_data
```

### Git Issues
```bash
# Discard local changes
git reset --hard origin/main

# Clean untracked files
git clean -fd
```

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [FVM Documentation](https://fvm.app/)
- [Fastlane Documentation](https://docs.fastlane.tools/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Shorebird Documentation](https://docs.shorebird.dev/)
- [BLoC Pattern Guide](https://bloclibrary.dev/)

---

## 🎯 Quick Checklist for New Developers

- [ ] Clone repository
- [ ] Install FVM
- [ ] Setup Flutter 3.5.4 with FVM
- [ ] Run `fvm flutter pub get`
- [ ] Generate code with build_runner
- [ ] Configure IDE (VS Code or Android Studio)
- [ ] Install Fastlane dependencies
- [ ] Setup Firebase CLI
- [ ] Run the app in development mode
- [ ] Create a test branch and make a small change
- [ ] Run tests and code analysis
- [ ] Create a PR to practice the workflow

---

Happy Coding! 🚀

