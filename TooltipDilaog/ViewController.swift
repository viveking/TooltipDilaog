//
//  ViewController.swift
//  TooltipDilaog
//
//  Created by Vivek on 6/27/19.
//  Copyright © 2019 Affixus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var tooltipDialog: TooltipView!
    var blurAnimator: UIViewPropertyAnimator!
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        effect = blurEffectView.effect
        blurEffectView.effect = nil
    }

    @IBAction func btnPress(_ sender: Any) {
        
        if(self.tooltipDialog.isHidden){
            /*let blurEffectView = UIVisualEffectView()
            blurEffectView.backgroundColor = .clear
            blurEffectView.frame = view.bounds
            */
            self.tooltipDialog.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            self.tooltipDialog.alpha = 0
            self.tooltipDialog.isHidden = false
            
            UIView.animate(withDuration: 0.4) {
                self.blurEffectView.effect = self.effect
                self.tooltipDialog.alpha = 1
                self.tooltipDialog.transform = CGAffineTransform.identity
            }
            
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            blurAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [blurEffectView] in
                blurEffectView?.effect = UIBlurEffect(style: .dark)
            }
            
            blurAnimator.fractionComplete = 0.15 // set the blur intensity.
            
        }else{
            UIView.animate(withDuration: 0.3
                , animations: {
                    self.tooltipDialog.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                    self.tooltipDialog.alpha = 0
                    self.blurEffectView.effect = nil
            }) { (success:Bool) in
                self.tooltipDialog.isHidden = true
            }
        }
    }
    
}

