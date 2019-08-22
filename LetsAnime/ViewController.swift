//
//  ViewController.swift
//  LetsAnime
//
//  Created by Embibe on 22/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import UIKit
import WebKit
import WebKit.WKWebView

class ViewController: UIViewController, WKNavigationDelegate {
    
    fileprivate var splashViewController: SplashViewController? = nil
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSplashViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        view.addSubview(webView)
        view.sendSubviewToBack(webView)
        //webView.sendSubviewToBack(self.view)
        // webView.navigationDelegate = self as WKNavigationDelegate
        if let url = URL(string: "https://www.google.com/") {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    func showSplashViewControllerNoPing() {
        
        let loadingScreen = SplashViewController(tileViewFileName: "Intro")
        self.splashViewController = loadingScreen
        loadingScreen.pulsing = true
        loadingScreen.view.backgroundColor = UIColor.white
        loadingScreen.willMove(toParent: self)
        addChild(loadingScreen)
        view.addSubview(loadingScreen.view)
        loadingScreen.didMove(toParent: self)
    }
    
    /// Simulates an API handshake success and transitions to MapViewController
    func showSplashViewController() {
        showSplashViewControllerNoPing()
        
        delay(6.00) {
            //self.showMenuNavigationViewController()
            self.splashViewController?.willMove(toParent: nil)
            self.splashViewController?.removeFromParent()
            self.splashViewController?.view.removeFromSuperview()
            self.didMove(toParent: nil)
        }
    }
    
    /// Displays the MapViewController
    func showMenuNavigationViewController() {
//        guard !(rootViewController is ObjectViewController) else { return }
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nav =  storyboard.instantiateViewController(withIdentifier: "ObjectViewController")
//
//        rootViewController?.willMove(toParent: nil)
//        rootViewController?.removeFromParent()
//        rootViewController?.view.removeFromSuperview()
//        rootViewController?.didMove(toParent: nil)
//
//        rootViewController = nav
//
//        nav.willMove(toParent: self)
//        addChild(nav)
//        view.addSubview(nav.view)
//        nav.didMove(toParent: self)
        
//        if let rootViewController = self.rootViewController {
//            self.rootViewController = nav
//            rootViewController.willMove(toParent: nil)
//            
//            transition(from: rootViewController, to: nav, duration: 0.55, options: [.transitionCrossDissolve, .curveEaseOut], animations: { () -> Void in
//                
//            }, completion: { _ in
//                nav.didMove(toParent: self)
//                rootViewController.removeFromParent()
//                rootViewController.didMove(toParent: nil)
//            })
//        } else {
//            rootViewController = nav
//            view.addSubview(nav.view)
//            nav.didMove(toParent: self)
//        }
    }
    
    
//    override var prefersStatusBarHidden : Bool {
//        switch spla  {
//        case is SplashViewController:
//            return true
//        case is ObjectViewController:
//            return false
//        default:
//            return false
//        }
//    }
    public func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
