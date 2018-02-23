//
//  NLPDemoViewController.swift
//  AI-in-iOS
//
//  Created by Xianning Liu  on 14/02/2018.
//  Copyright © 2018 Xianning Liu . All rights reserved.
//

import UIKit
import Speech
class NLPDemoViewController: UIViewController, SFSpeechRecognizerDelegate {
    var textView:UITextView!
    
    lazy var speechRecoginizer:SFSpeechRecognizer? = {
        if let recoginiser = SFSpeechRecognizer(locale: Locale(identifier: "en_US")){
            recoginiser.delegate = self
            return recoginiser
        } else {
            return nil
        }
    }()
    
    
    override func viewDidLoad() {
        addTextArea()
        addRecordButton()
    }
    
    @objc func recordButtonTapped(){
        print("record button tapped .........")
    }
    
    fileprivate func addTextArea() {
        self.textView?.removeFromSuperview()
        textView = UITextView(frame: CGRect(x: 10, y: 10, width: UIConstants.SCREEN_WIDTH - 20, height: 100))
        textView.textColor = UIColor.red
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        self.view.addSubview(textView)
    }
    
    fileprivate func addRecordButton() {
        let recordButton = UIButton(frame: CGRect(x: UIConstants.SCREEN_WIDTH/2 - 100, y: UIConstants.SCREEN_HEIGHT - 100, width: 200, height: 30))
        recordButton.setTitle("Start voice recording", for: .normal)
        recordButton.backgroundColor=UIColor.blue
        recordButton.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
        self.view.addSubview(recordButton)
    }
    
}

//MARK: SFSpeechRecoginizerDelegate
extension NLPDemoViewController {
    
}

