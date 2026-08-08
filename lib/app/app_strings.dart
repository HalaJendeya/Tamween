abstract final class AppStrings {
  // Common / General
  static const appName = 'تموين بلس';
  static const searchPlaceholder = 'البحث عن متجر أو منتج';
  static const riyal = 'ريال';
  static const startShopping = 'ابدأ التسوق الآن';
  static const startShoppingSubtitle = 'ابدأ التسوق والطلب الآن';
  static const welcome = 'مرحباً بك في تموين بلس';
  static const defaultAddress = 'المنزل: المنطقة الحمراء، الرياض';
  static const deliverTo = 'توصيل إلى';

  // Formatters
  static String price(double price) => '${price.toStringAsFixed(2)} $riyal';
  static String addedToCart(String name) => 'تمت إضافة $name إلى السلة';

  // Login Screen
  static const login = 'تسجيل الدخول';
  static const phoneOrEmail = 'رقم الجوال / البريد الإلكتروني';
  static const enterPhoneOrEmail = 'أدخل رقم الجوال أو البريد الإلكتروني';
  static const password = 'كلمة المرور';
  static const passwordMinLengthError = 'يجب أن لا تقل كلمة المرور عن 7 خانات';
  static const forgotPassword = 'نسيت كلمة المرور؟';
  static const isNewUser = 'هل أنت مستخدم جديد في تموين بلس؟';
  static const createAccount = 'أنشئ حسابك';
  static const registerAsMerchantPrompt = 'سجل كتاجر في التطبيق؟';
  static const registerNow = 'سجل الآن';

  // Home Screen / Store Screen Categories
  static const categoryAll = 'الكل';
  static const categoryVegetables = 'الخضروات';
  static const categorySnacks = 'سناكس';
  static const categoryMeats = 'اللحوم';
  static const categorySweets = 'حلويات';
  static const categoryFruits = 'الفواكه';

  // Store Details Screen
  static const storeDetails = 'معلومات المتجر والتفاصيل';

  // Product Card
  static const addToCart = 'أضف للسلة';

  // Cart Screen
  static const cartTitle = 'سلة التسوق';
  static const cartEmpty = 'سلة الشراء فارغة حالياً';
  static const noFavorites = 'لا توجد منتجات في المفضلة';

  // Orders Screen
  static const currentOrders = 'الطلبات الحالية';
  static const completedOrders = 'الطلبات المكتملة';
  static const noCurrentOrders = 'لا يوجد طلبات حالية';

  // Profile Screen
  static const profileName = 'محمد خالد إبراهيم';
  static const profileEmail = 'name@domain.com';
  static const accountData = 'بيانات الحساب';
  static const editAccountData = 'تعديل البيانات';
  static const changePassword = 'تعديل كلمة المرور';
  static const createNewPassword = 'أنشئ كلمة مرور جديدة';
  static const appLanguage = 'لغة التطبيق';
  static const appLanguageSubtitle = 'تم تغيير اللغة إلى الإنجليزية';
  static const registerAsMerchant = 'سجل كتاجر في التطبيق';
  static const createYourStore = 'أنشئ متجرك في تموين بلس';
  static const receiveNotifications = 'استقبل الإشعارات';
  static const receiveNotificationsSubtitle = 'تفعيل إشعارات الطلبات والعروض';
  static const contactUs = 'تواصل معنا';
  static const contactUsSubtitle = 'الاقتراحات والشكاوى';
  static const faq = 'الأسئلة الشائعة';
  static const aboutApp = 'عن التطبيق';
  static const termsAndConditions = 'الشروط والأحكام';
  static const logout = 'تسجيل الخروج';
}
