# Home4U Development Toolchain Overview

## 🔄 Complete Development & Deployment Pipeline

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          DEVELOPMENT ENVIRONMENT                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐      ┌──────────────┐      ┌──────────────┐             │
│  │     FVM      │──────▶│   Flutter    │──────▶│   VS Code/   │             │
│  │   Version    │      │   SDK 3.5.4  │      │Android Studio│             │
│  │   Manager    │      │              │      │              │             │
│  └──────────────┘      └──────────────┘      └──────────────┘             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                          SOURCE CODE MANAGEMENT                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────┐      ┌──────────────┐      ┌──────────────┐             │
│  │     Git      │──────▶│   GitHub     │──────▶│   Feature    │             │
│  │  Repository  │      │  Remote Repo │      │   Branches   │             │
│  └──────────────┘      └──────────────┘      └──────────────┘             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                        CONTINUOUS INTEGRATION (CI)                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                      GitHub Actions Workflow                         │   │
│  │                                                                      │   │
│  │  1. Code Checkout ──▶ 2. Flutter Setup ──▶ 3. Dependencies        │   │
│  │                                                                      │   │
│  │  4. Code Generation ──▶ 5. Code Analysis ──▶ 6. Run Tests         │   │
│  │                                                                      │   │
│  │  7. Build APK/AAB ──▶ 8. Upload Artifacts                          │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                    ┌───────────────┼───────────────┐
                    ▼               ▼               ▼
┌──────────────────────┐  ┌──────────────────────┐  ┌──────────────────────┐
│  DEPLOYMENT METHODS  │  │  DEPLOYMENT METHODS  │  │  DEPLOYMENT METHODS  │
├──────────────────────┤  ├──────────────────────┤  ├──────────────────────┤
│                      │  │                      │  │                      │
│  ┌────────────────┐ │  │  ┌────────────────┐ │  │  ┌────────────────┐ │
│  │   Fastlane     │ │  │  │  GitHub        │ │  │  │   Shorebird    │ │
│  │   Automation   │ │  │  │  Actions       │ │  │  │   OTA Updates  │ │
│  │                │ │  │  │  Auto Deploy   │ │  │  │                │ │
│  └────────────────┘ │  │  └────────────────┘ │  │  └────────────────┘ │
│         │           │  │         │           │  │         │           │
│         ▼           │  │         ▼           │  │         ▼           │
│  Firebase App       │  │  Firebase App       │  │  Direct to Users   │
│  Distribution       │  │  Distribution       │  │  (No Store)        │
│  (Manual Trigger)   │  │  (Automated)        │  │  (Hot Fix)         │
│                      │  │                      │  │                      │
└──────────────────────┘  └──────────────────────┘  └──────────────────────┘
                                    │
                    ┌───────────────┼───────────────┐
                    ▼               ▼               ▼
┌──────────────────────┐  ┌──────────────────────┐  ┌──────────────────────┐
│  TESTING & FEEDBACK  │  │  PRODUCTION RELEASE  │  │   STORE RELEASE      │
├──────────────────────┤  ├──────────────────────┤  ├──────────────────────┤
│                      │  │                      │  │                      │
│  Firebase App        │  │  Internal Testing    │  │  Google Play Store   │
│  Distribution        │  │  Groups              │  │  Apple App Store     │
│                      │  │                      │  │                      │
│  • QA Team          │  │  • Beta Users        │  │  • Public Release    │
│  • Internal Testers  │  │  • Staged Rollout    │  │  • Production Users  │
│                      │  │                      │  │                      │
└──────────────────────┘  └──────────────────────┘  └──────────────────────┘
```

## 🛠️ Tool Responsibilities

### 1. **FVM (Flutter Version Manager)**
**Purpose**: Ensures consistent Flutter SDK version across team and environments

**Key Features:**
- ✅ Project-specific Flutter versions
- ✅ Easy version switching
- ✅ No global SDK conflicts
- ✅ Team synchronization

**When to Use:**
- Daily development
- All Flutter commands
- CI/CD pipelines
- Team collaboration

---

### 2. **Fastlane**
**Purpose**: Automates build and deployment processes

**Key Features:**
- ✅ Automated builds (APK/AAB)
- ✅ Firebase App Distribution integration
- ✅ Code signing automation
- ✅ Customizable deployment lanes

**When to Use:**
- Manual deployments to testers
- Custom build workflows
- Integration with Firebase
- Scheduled releases

**Available Lanes:**
```ruby
firebase_distribution  # Deploy to Firebase App Distribution
deploy_playstore      # Deploy to Play Store (if configured)
beta                  # Beta testing builds
```

---

### 3. **GitHub Actions**
**Purpose**: Continuous Integration and Continuous Deployment (CI/CD)

**Key Features:**
- ✅ Automated testing on every push/PR
- ✅ Code quality checks (analyze, format)
- ✅ Automatic builds
- ✅ Deployment to Firebase
- ✅ Integration with Shorebird

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests
- Manual workflow dispatch
- Scheduled runs (optional)

**Workflow Steps:**
1. Checkout code
2. Setup Flutter with FVM
3. Install dependencies
4. Run code generation
5. Analyze code
6. Run tests with coverage
7. Build APK/AAB
8. Deploy (if main branch)

---

### 4. **Shorebird**
**Purpose**: Over-the-Air (OTA) updates without store approval

**Key Features:**
- ✅ Instant bug fixes
- ✅ No store review wait
- ✅ Gradual rollout
- ✅ Rollback capability
- ✅ Analytics and monitoring

**When to Use:**
- Critical bug fixes
- Minor UI updates
- Performance improvements
- Feature flag changes

**NOT for:**
- Native code changes
- Dependency updates
- Major features
- Breaking changes

**Commands:**
```bash
shorebird patch android    # Create hot fix
shorebird release android  # New full release
shorebird patch list       # View patches
```

---

## 🔄 Complete Deployment Workflow Comparison

| Aspect | **Fastlane** | **GitHub Actions** | **Shorebird** |
|--------|-------------|-------------------|---------------|
| **Trigger** | Manual command | Git push/PR | Manual command |
| **Speed** | 5-10 minutes | 10-15 minutes | 2-5 minutes |
| **Automation** | Semi-automated | Fully automated | Manual |
| **Best For** | Quick manual deploys | Continuous deployment | Hot fixes |
| **Requires** | Local setup | GitHub repo | Shorebird account |
| **Review Time** | Immediate | Immediate | Immediate |
| **Rollback** | Manual | Manual | Automatic |

---

## 🎯 Recommended Workflows by Scenario

### Scenario 1: Daily Development
```bash
fvm flutter run --flavor development -t lib/main_development.dart
```
**Tools Used:** FVM

---

### Scenario 2: Feature Complete - Testing
```bash
cd android
bundle exec fastlane firebase_distribution
```
**Tools Used:** FVM + Fastlane

---

### Scenario 3: Production Release
```bash
git push origin main
# GitHub Actions automatically builds and deploys
```
**Tools Used:** GitHub Actions + FVM + Fastlane

---

### Scenario 4: Critical Bug Fix
```bash
# Fix the bug in code
shorebird patch android --flavor production
```
**Tools Used:** Shorebird

---

## 📊 Development Process Flow

```
Developer Workflow:
1. git checkout -b feature/new-feature
2. fvm flutter run (develop & test)
3. fvm flutter test (run tests)
4. fvm flutter analyze (check code quality)
5. git commit -m "feat: add new feature"
6. git push origin feature/new-feature
7. Create Pull Request

↓ GitHub Actions (Automatic)
8. Run tests
9. Run code analysis
10. Build APK
11. Comment on PR with results

↓ Code Review & Merge
12. Team reviews code
13. Merge to main branch

↓ Deployment (Choose one)

Option A: Automatic (GitHub Actions)
14. Automatically builds and deploys to Firebase

Option B: Manual (Fastlane)
14. Run: bundle exec fastlane firebase_distribution

Option C: Hot Fix (Shorebird)
14. Run: shorebird patch android --flavor production
```

---

## 🚀 Quick Start Commands

### First Time Setup
```bash
# 1. Install FVM
dart pub global activate fvm

# 2. Setup Flutter version
fvm install 3.5.4 && fvm use 3.5.4

# 3. Get dependencies
fvm flutter pub get

# 4. Setup Fastlane
cd android && bundle install && cd ..

# 5. Run app
fvm flutter run --flavor development
```

### Daily Development
```bash
# Pull latest changes
git pull origin main

# Run development build
fvm flutter run --flavor development

# Run tests before commit
fvm flutter test && fvm flutter analyze

# Commit and push
git add . && git commit -m "feat: description" && git push
```

### Deploy to Testers
```bash
# Option 1: Using Fastlane
cd android && bundle exec fastlane firebase_distribution

# Option 2: Push to main (triggers GitHub Actions)
git push origin main
```

### Emergency Hot Fix
```bash
# Fix bug, then:
shorebird patch android --flavor production
```

---

## 🎓 Learning Resources

- **FVM**: https://fvm.app/docs/getting_started/overview
- **Fastlane**: https://docs.fastlane.tools/
- **GitHub Actions**: https://docs.github.com/en/actions
- **Shorebird**: https://docs.shorebird.dev/
- **Flutter CI/CD**: https://docs.flutter.dev/deployment/cd

---

## 💡 Pro Tips

1. **Always use FVM** for Flutter commands to ensure consistency
2. **Test Fastlane locally** before pushing to CI/CD
3. **Use GitHub Actions** for automated testing on every PR
4. **Reserve Shorebird** for emergency fixes only
5. **Document your lanes** in Fastlane for team clarity
6. **Monitor deployment status** in Firebase Console
7. **Keep secrets secure** in GitHub Secrets and `.env` files

---

**Need Help?** Check the [main README](README.md) or [Development Workflow Guide](DEVELOPMENT_WORKFLOW.md)

