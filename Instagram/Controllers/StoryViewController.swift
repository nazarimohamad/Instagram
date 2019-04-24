//
//  StoryViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/23/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class StoryViewController: UIViewController {
    
    var storyImage: Story? {
        didSet {
            if let storyImageName = storyImage?.storyImageName {
                imageView.image = UIImage(named: storyImageName)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow)?.isHidden = true
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)

        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onDrage(_:))))
    }
    
    @objc func onDrage(_ sender:UIPanGestureRecognizer) {
        let percentThreshold:CGFloat = 0.3
        let translation = sender.translation(in: view)
        
        let newY = ensureRange(value: view.frame.minY + translation.y, minimum: 0, maximum: view.frame.maxY)
        let progress = progressAlongAxis(newY, view.bounds.width)
        
        view.frame.origin.y = newY //Move view to new position
        
        if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            if velocity.y >= 300 || progress > percentThreshold {
                self.dismiss(animated: true) //Perform dismiss
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.frame.origin.y = 0 // Revert animation
                })
            }
        }
        
        sender.setTranslation(.zero, in: view)
    }
    
    
    func progressAlongAxis(_ pointOnAxis: CGFloat, _ axisLength: CGFloat) -> CGFloat {
        let movementOnAxis = pointOnAxis / axisLength
        let positiveMovementOnAxis = fmaxf(Float(movementOnAxis), 0.0)
        let positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0)
        return CGFloat(positiveMovementOnAxisPercent)
    }
    
    func ensureRange<T>(value: T, minimum: T, maximum: T) -> T where T : Comparable {
        return min(max(value, minimum), maximum)
    }
        
        
    
    let imageView: UIImageView = {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.image = UIImage(named: "")
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
}


