//
//  ModalViewController.swift
//  Exam2
//
//  Created by Klein, Brian K on 11/4/19.
//  Copyright © 2019 Tim Gegg-Harrison. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController {
    
    let purpleBalloons: UIImageView = UIImageView()
    var counter: Int = 0
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        
        purpleBalloons.image = UIImage(named: "purple")
        purpleBalloons.frame = CGRect(x: 0, y: 0, width: 96, height: 96)
        purpleBalloons.center.x = view.center.x
        purpleBalloons.center.y = view.center.y
        purpleBalloons.isUserInteractionEnabled = true
        purpleBalloons.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ModalViewController.issueAlert(_:))))

        
        view.addSubview(purpleBalloons)
    }
    
    @objc func issueAlert(_ recognizer: UITapGestureRecognizer) {
        counter += 1
        let alert: UIAlertController = UIAlertController(title: "Alert", message: "Would you like the balloons to grow or shrink?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Grow", style:
            UIAlertAction.Style.default, handler:
            {(action: UIAlertAction!) -> Void in
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    () -> Void in
                    self.purpleBalloons.frame = CGRect(x: 0, y: 0, width: self.purpleBalloons.frame.width*1.25, height: self.purpleBalloons.frame.height*1.25)
                    self.purpleBalloons.center.x = self.view.center.x
                    self.purpleBalloons.center.y = self.view.center.y                }, completion: {
                    (Bool) -> Void in
                        if(self.counter == 3) {
                            let alert: UIAlertController = UIAlertController(title: "Alert", message: "Would you like to return to the main screen?", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Yes", style:
                                UIAlertAction.Style.default, handler:
                                {(action: UIAlertAction!) -> Void in
                                    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                                        () -> Void in
                                        //dismiss ModalViewController here
                                        self.presentingViewController?.dismiss(animated: true, completion:
                                            {() -> Void in
                                            
                                        })

                                    },
                                        completion: {
                                        (Bool) -> Void in
                                        
                                    })
                            }))
                            alert.addAction(UIAlertAction(title: "No", style:
                                UIAlertAction.Style.default, handler:
                                {(action: UIAlertAction!) -> Void in
                                    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                                        () -> Void in
                                        self.counter = 0
                                    },
                                        completion: {
                                        (Bool) -> Void in
                                        
                                    })
                            }))
                            self.present(alert, animated: true, completion:
                                {() -> Void in
                            })
                        }
                })
        }))
        alert.addAction(UIAlertAction(title: "Shrink", style:
            UIAlertAction.Style.default, handler:
            {(action: UIAlertAction!) -> Void in
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    () -> Void in
                    self.purpleBalloons.frame = CGRect(x: 0, y: 0, width: self.purpleBalloons.frame.width*0.75, height: self.purpleBalloons.frame.height*0.75)
                    self.purpleBalloons.center.x = self.view.center.x
                    self.purpleBalloons.center.y = self.view.center.y               },
                    completion: {
                    (Bool) -> Void in
                    
                })
        }))
        present(alert, animated: true, completion:
            {() -> Void in
        })
    }
}
