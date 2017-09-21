//
//  LandingViewController.swift
//  QRReaderDemo
//
//  Created by Arun Kumar Nama on 21/9/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

//
//  LTDemoViewController.swift
//  LTMorphingLabelDemo
//
//  Created by Lex on 6/23/14.
//  Copyright (c) 2015 lexrus.com. All rights reserved.
//

import UIKit

class LandingViewController : UIViewController, LTMorphingLabelDelegate,UIViewControllerTransitioningDelegate {
    @IBOutlet weak var labelTest: GlitchLabel!
  
  
    @IBOutlet fileprivate var label: LTMorphingLabel!
    fileprivate var i = -1
    fileprivate var textArray = [
        "What is design?",
        "Design", "Design is not just", "what it looks like", "and feels like.",
        "Design", "is how it works.", "- Steve Jobs",
        "Older people", "sit down and ask,", "'What is it?'",
        "but the boy asks,", "'What can I do with it?'.", "- Steve Jobs",
        "", "Swift", "Objective-C", "iPhone", "iPad", "Mac Mini",
        "MacBook Pro🔥", "Mac Pro⚡️",
        "爱老婆",
        "नमस्ते दुनिया",
        "हिन्दी भाषा"
    ]
    fileprivate var text: String {
        i = i >= textArray.count - 1 ? 0 : i + 1
        return textArray[i]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.delegate = self
        if let effect = LTMorphingEffect(rawValue: 2) {
            label.morphingEffect = effect
           // changeText(sender)
        }

               
        // Buttton 
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
   
    
    @IBAction func changeText(_ sender: AnyObject) {
        label.text = text
    }
    
    @IBAction func clear(_ sender: Any) {
        label.text = nil
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        let seg = sender
        if let effect = LTMorphingEffect(rawValue: seg.selectedSegmentIndex) {
            label.morphingEffect = effect
            changeText(sender)
        }
    }
    
    @IBAction func toggleLight(_ sender: UISegmentedControl) {
        let isNight = Bool(sender.selectedSegmentIndex == 0)
        view.backgroundColor = isNight ? UIColor.black : UIColor.white
        label.textColor = isNight ? UIColor.white : UIColor.black
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        label.font = UIFont.init(name: label.font.fontName, size: CGFloat(sender.value))
        label.text = label.text
    }
    
    
    
}



extension LandingViewController {
    
    func morphingDidStart(_ label: LTMorphingLabel) {
        
    }
    
    func morphingDidComplete(_ label: LTMorphingLabel) {
        
    }
    
    func morphingOnProgress(_ label: LTMorphingLabel, progress: Float) {
        
    }
    
}
