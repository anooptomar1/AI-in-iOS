//
//  NLPDemoViewController.swift
//  AI-in-iOS
//
//  Created by Xianning Liu  on 14/02/2018.
//  Copyright © 2018 Xianning Liu . All rights reserved.
//

import UIKit
class NLPDemoViewController: UIViewController {
    var textView:UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        addTextArea();
    }
    
    func performAnalysis(){
    }
    
    private func addTextArea() {
        self.textView?.removeFromSuperview()
        textView = UITextView(frame: CGRect(x: 10, y: 10, width: UIConstants.SCREEN_WIDTH - 20, height: 100))
        textView.textColor = UIColor.red
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        self.view.addSubview(textView)
    }
}