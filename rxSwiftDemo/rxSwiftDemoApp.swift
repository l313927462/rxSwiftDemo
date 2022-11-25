//
//  rxSwiftDemoApp.swift
//  rxSwiftDemo
//
//  Created by Magus on 2022/11/26.
//


import SwiftUI






class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("log-didFinishLaunching")
        return true
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("log-DidReceiveMemoryWarning")
        
    }
    
    
    //openURL，userActivity等可以直接挂在某一个具体的View上，来进行单独处理，不需要再通过AppDelegate中转了。
}

@main
struct rxSwiftDemo: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    iOS13以前，由UIApplicationDelegate来控制声明周期，iOS13后，由UISceneDelegate来控制声明周期
//    在iOS13后，Scene取代了Window，来做视图的管理和呈现。主要是为了解决iPadOS展示多窗口的问题。
//    反斜杠（\）表示我们正在使用键路径，每当属性值更改时，就会调用onChange修饰符
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
              print("应用启动了")
            case .inactive:
              print("应用休眠了")
            case .background:
              print("应用在后台展示")
            @unknown default:
              print("default")
            }
        }
    }
}
