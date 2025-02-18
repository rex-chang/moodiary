import 'package:moodiary/pages/about/about_logic.dart';
import 'package:moodiary/pages/about/about_view.dart';
import 'package:moodiary/pages/agreement/agreement_view.dart';
import 'package:moodiary/pages/analyse/analyse_logic.dart';
import 'package:moodiary/pages/analyse/analyse_view.dart';
import 'package:moodiary/pages/assistant/assistant_logic.dart';
import 'package:moodiary/pages/assistant/assistant_view.dart';
import 'package:moodiary/pages/backup_sync/backup_sync_logic.dart';
import 'package:moodiary/pages/backup_sync/backup_sync_view.dart';
import 'package:moodiary/pages/category_manager/category_manager_logic.dart';
import 'package:moodiary/pages/category_manager/category_manager_view.dart';
import 'package:moodiary/pages/diary_details/diary_details_view.dart';
import 'package:moodiary/pages/diary_setting/diary_setting_logic.dart';
import 'package:moodiary/pages/diary_setting/diary_setting_view.dart';
import 'package:moodiary/pages/draw/draw_logic.dart';
import 'package:moodiary/pages/draw/draw_view.dart';
import 'package:moodiary/pages/edit/edit_logic.dart';
import 'package:moodiary/pages/edit/edit_view.dart';
import 'package:moodiary/pages/font/font_logic.dart';
import 'package:moodiary/pages/font/font_view.dart';
import 'package:moodiary/pages/home/home_logic.dart';
import 'package:moodiary/pages/home/home_view.dart';
import 'package:moodiary/pages/image/image_logic.dart';
import 'package:moodiary/pages/image/image_view.dart';
import 'package:moodiary/pages/laboratory/laboratory_logic.dart';
import 'package:moodiary/pages/laboratory/laboratory_view.dart';
import 'package:moodiary/pages/lock/lock_logic.dart';
import 'package:moodiary/pages/lock/lock_view.dart';
import 'package:moodiary/pages/login/login_logic.dart';
import 'package:moodiary/pages/login/login_view.dart';
import 'package:moodiary/pages/map/map_logic.dart';
import 'package:moodiary/pages/map/map_view.dart';
import 'package:moodiary/pages/privacy/privacy_logic.dart';
import 'package:moodiary/pages/privacy/privacy_view.dart';
import 'package:moodiary/pages/recycle/recycle_logic.dart';
import 'package:moodiary/pages/recycle/recycle_view.dart';
import 'package:moodiary/pages/share/share_logic.dart';
import 'package:moodiary/pages/share/share_view.dart';
import 'package:moodiary/pages/sponsor/sponsor_view.dart';
import 'package:moodiary/pages/start/start_logic.dart';
import 'package:moodiary/pages/start/start_view.dart';
import 'package:moodiary/pages/user/user_logic.dart';
import 'package:moodiary/pages/user/user_view.dart';
import 'package:moodiary/pages/video/video_logic.dart';
import 'package:moodiary/pages/video/video_view.dart';
import 'package:refreshed/refreshed.dart';

import '../pages/sponsor/sponsor_logic.dart';
import '../pages/web_view/web_view_logic.dart';
import '../pages/web_view/web_view_view.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> routes = [
    //启动页
    GetPage(
      name: AppRoutes.startPage,
      page: () => const StartPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => StartLogic())],
    ),
    //首页路由
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => HomeLogic())],
    ),
    //分析
    GetPage(
      name: AppRoutes.analysePage,
      page: () => const AnalysePage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => AnalyseLogic())],
    ),
    //日记页路由
    GetPage(
      name: AppRoutes.diaryPage,
      showCupertinoParallax: false,
      page: () => DiaryDetailsPage(),
    ),
    //图片路由
    GetPage(
      name: AppRoutes.photoPage,
      page: () => const ImagePage(),
      popGesture: false,
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => ImageLogic())],
    ),
    //回收站
    GetPage(
      name: AppRoutes.recyclePage,
      page: () => const RecyclePage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => RecycleLogic())],
    ),
    //登录路由
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => LoginLogic())],
    ),
    //新增/编辑日记路由
    GetPage(
      name: AppRoutes.editPage,
      page: () => const EditPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => EditLogic())],
    ),
    //分享页路由
    GetPage(
      name: AppRoutes.sharePage,
      page: () => const SharePage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => ShareLogic())],
    ),
    //字体页路由
    GetPage(
      name: AppRoutes.fontPage,
      page: () => const FontPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => FontLogic())],
    ),
    //实验室路由
    GetPage(
      name: AppRoutes.laboratoryPage,
      page: () => const LaboratoryPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => LaboratoryLogic())],
    ),
    //画画路由
    GetPage(
      name: AppRoutes.drawPage,
      page: () => const DrawPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => DrawLogic())],
    ),
    //隐私政策
    GetPage(
      name: AppRoutes.privacyPage,
      page: () => const PrivacyPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => PrivacyLogic())],
    ),
    //用户协议
    GetPage(
      name: AppRoutes.agreementPage,
      showCupertinoParallax: false,
      page: () => const AgreementPage(),
    ),
    //锁
    GetPage(
      name: AppRoutes.lockPage,
      page: () => const LockPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => LockLogic())],
    ),
    GetPage(
      name: AppRoutes.userPage,
      page: () => const UserPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => UserLogic())],
    ),
    GetPage(
      name: AppRoutes.categoryManagerPage,
      page: () => const CategoryManagerPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => CategoryManagerLogic())],
    ),
    GetPage(
      name: AppRoutes.aboutPage,
      page: () => const AboutPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => AboutLogic())],
    ),
    GetPage(
      name: AppRoutes.videoPage,
      popGesture: false,
      page: () => const VideoPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => VideoLogic())],
    ),
    GetPage(
      name: AppRoutes.mapPage,
      page: () => const MapPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => MapLogic())],
    ),
    GetPage(
      name: AppRoutes.diarySettingPage,
      page: () => const DiarySettingPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => DiarySettingLogic())],
    ),
    GetPage(
      name: AppRoutes.backupSyncPage,
      page: () => const BackupSyncPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => BackupSyncLogic())],
    ),
    GetPage(
      name: AppRoutes.assistantPage,
      page: () => const AssistantPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => AssistantLogic())],
    ),
    GetPage(
      name: AppRoutes.sponsorPage,
      page: () => const SponsorPage(),
      showCupertinoParallax: false,
      binds: [Bind.lazyPut(() => SponsorLogic())],
    ),
    GetPage(
      name: AppRoutes.webViewPage,
      showCupertinoParallax: false,
      page: () => const WebViewPage(),
      binds: [Bind.lazyPut(() => WebViewLogic())],
    ),
  ];
}
