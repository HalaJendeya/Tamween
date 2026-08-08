# Tamween Plus Flutter UI

An RTL, UI-only Flutter prototype based on the supplied Tamween screens. It uses local mock data and contains no API or backend layer.

## Included flow

- Splash automatically opens Login.
- Login opens Home after basic local validation.
- Home store cards open Store Details.
- Bottom navigation connects Home, Orders, Cart, Favorites, and Profile.
- Favorite and Add to Cart buttons update local in-memory state.
- Empty-state buttons return to Home.
- Profile logout returns to Login and clears the navigation stack.

## First run on Windows

1. Install Flutter and make sure `flutter --version` works.
2. Double-click `bootstrap_windows.bat`, or run:

```powershell
flutter create --platforms=android,ios .
flutter pub get
flutter run
```

The first command adds the standard Android and iOS runner folders without replacing the app source.
