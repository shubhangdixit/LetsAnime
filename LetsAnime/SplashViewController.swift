//
//  SplashViewController.swift
//  LetsAnime
//
//  Created by Embibe on 22/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import Foundation
import UIKit
import Lottie

open class SplashViewController: UIViewController {
    open var pulsing: Bool = false
    
    var animatedLogoView : AnimationView!
    
    public init(tileViewFileName: String) {
        
        super.init(nibName: nil, bundle: nil)
        animatedLogoView = AnimationView(name: tileViewFileName)
        animatedLogoView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        
        view.addSubview(animatedLogoView)
        animatedLogoView.layer.position = view.layer.position
        
        animatedLogoView.loopMode = .loop
        animatedLogoView.play()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override var prefersStatusBarHidden : Bool {
        return true
    }
}
