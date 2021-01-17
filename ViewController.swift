//
//  ViewController.swift
//  Exam2
//
//  Created by ________________________ on 11/4/19.
//  Copyright © 2019 _______________________. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myLabel: UILabel = UILabel()
    private let myLabel2: UILabel = UILabel()
    private var myImage: UIImageView = UIImageView()
    private var myButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        myLabel.frame = CGRect(x: view.frame.maxX-125 , y: view.frame.maxY-75, width: 100, height: 25)
        myLabel.text = "Brian Klein"
        myLabel.textColor = UIColor.blue
        myLabel.backgroundColor = UIColor.white
        
        myLabel2.frame = CGRect(x: view.frame.maxX-125 , y: view.frame.maxY-50, width: 100, height: 25)
        myLabel2.text = "CS 345"
        myLabel2.textColor = UIColor.blue
        myLabel2.backgroundColor = UIColor.white
        
        myImage.image = UIImage(named: "multi")
        myImage.frame = CGRect(x: view.center.x-48, y: view.frame.maxY-176, width: 96, height: 96)
        myImage.isUserInteractionEnabled = true
        myImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.floatBalloons(_:))))

        myButton.frame = CGRect(x: view.frame.minX+25, y: view.frame.maxY-75, width: 100, height: 50)
        myButton.backgroundColor = UIColor.blue
        myButton.setTitle("Next", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        myButton.addTarget(self, action: #selector(ViewController.myButtonPressed), for: UIControl.Event.touchUpInside)
        
        view.addSubview(myLabel)
        view.addSubview(myLabel2)
        view.addSubview(myImage)
        view.addSubview(myButton)
        
        
    }
    
    @objc func floatBalloons(_ recognizer: UITapGestureRecognizer) {
        let topPoint: CGPoint = CGPoint(x: view.center.x, y: view.frame.minY+96)
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            () -> Void in
            self.myImage.center = topPoint
        }, completion: {
            (Bool) -> Void in

        })
    }
    
    @objc func myButtonPressed() {
        let mvc: ModalViewController = ModalViewController()
        mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        mvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(mvc, animated: true, completion: {
            () -> Void in
            mvc.viewDidLoad()
        })
    }
}
