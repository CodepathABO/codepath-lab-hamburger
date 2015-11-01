//
//  HamburgerViewController.swift
//  codepath-lab-hamburger
//
//  Created by Sebastian Drew on 10/6/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var initialCenter: CGPoint!
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    
    var rotation: CGFloat!
    var foreshortening: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController")
        
       menuViewController.view.frame = menuView.frame
       feedViewController.view.frame = menuView.frame
        
        menuView.addSubview(menuViewController.view)
        contentView.addSubview(feedViewController.view)
        
        menuViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
        
        
        rotation = 0
        foreshortening = 100
        
    //    setAnchorPoint(CGPoint(x: 1.0, y: 0.5), forView: contentView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
      //  let location = sender.locationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            initialCenter = contentView.center
            
            // ...
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            let menuScale = convertValue(contentView.frame.origin.x, r1Min: 0, r1Max: 260, r2Min: 0.9, r2Max: 1.0)
            
            contentView.center = CGPoint(x: translation.x + initialCenter.x, y: initialCenter.y)
            
            // print(contentView.frame.origin.x)
            
            // convertValue(contentView.frame.origin.x, r1Min: 0, r1Max: 260, r2Min: 0.9, r2Max: 1.0)
            
            menuViewController.view.transform = CGAffineTransformMakeScale(menuScale, menuScale)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
                if velocity.x < 0 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.contentView.center = self.view.center
                        
                    })
                    
                } else {
                    
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.contentView.center = CGPoint(x: self.view.center.x + 270, y: self.view.center.y)
                      
                    })
                    
                   
                }
            if contentView.frame.origin.x == 270 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.menuViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    
                    
                    
                    
                })
            }
            else if contentView.frame.origin.x == 0 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.menuViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
                    
                    
                    
                    
                })
            }
            
            
            
            
            
            // ..
            
        }

        
    }
    
    
//    func updateTransform() {
//        
//        // print("slider Value: \(sender.value)")
//        
//        var transform = CATransform3DIdentity
//        var
//        
//        
//        transform.m34 = 1.0 / foreshortening
//        
//        let angle = rotation * CGFloat(M_PI) / 180.0
//        
//        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
//        
//        contentView.layer.transform = transform
//        
//        
//    }
//    
//    
//    
//    
//    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
//        var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
//        var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
//        
//        newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
//        oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
//        
//        var position = view.layer.position
//        position.x -= oldPoint.x
//        position.x += newPoint.x
//        
//        position.y -= oldPoint.y
//        position.y += newPoint.y
//        
//        view.layer.position = position
//        view.layer.anchorPoint = anchorPoint
//    }
//

}
