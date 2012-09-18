class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = MyNavigationController.alloc.initWithRootViewController(MapController.alloc.init)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    NSSetUncaughtExceptionHandler("uncaughtExceptionHandler")
    FlurryAnalytics.startSession("VNHHFKB2GK8BT22TPQRK")
    FlurryAnalytics.setUserID('markrickert')

    true
  end

  #Flurry exception handler
  #Commented out till I can figure out how to implement Flurry
  def uncaughtExceptionHandler(exception)
    FlurryAnalytics.logError("Uncaught", message:"Crash!", exception:exception)
  end

end
