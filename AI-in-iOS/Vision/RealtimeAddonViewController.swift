//
//  DynamicTrackViewController.swift
//  AI-in-iOS
//
//  Created by Xianning Liu  on 17/02/2018.
//  Copyright © 2018 Xianning Liu . All rights reserved.
//

import UIKit
import AVKit
class RealtimeAddonViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var session:AVCaptureSession!
    var previewLayer:AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCameraAuthorisation()
    }
    
    private func getCameraAuthorisation() {
        let vedioStatua = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch vedioStatua {
        case .denied,
             .restricted:
            showWarningMessage()
        default:
            showWarningMessage()
        }
    }
    
    private func showWarningMessage() {
        let alertView = UIAlertController(title: "Camera is not authorised", message: "Please go to settings > privacy -> Camera to open the priviledge", preferredStyle: .actionSheet)
        let defaultActipn = UIAlertAction(title: "OK", style: .default)
        alertView.addAction(defaultActipn)
        self.present(alertView, animated: true, completion: nil)
    }
    
    private func initCapture() {
        session = AVCaptureSession()
        let device = AVCaptureDevice.default(for: .video)
        do{
            let deviceInput = try AVCaptureDeviceInput(device: device!)
            session.addInput(deviceInput)
        } catch {
            fatalError(error.localizedDescription)
        }
        
        let deviceOutput = AVCaptureVideoDataOutput()
        deviceOutput.setSampleBufferDelegate(self, queue: DispatchQueue.main)
        session.addOutput(deviceOutput)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        self.view.layer.addSublayer(previewLayer)
        self.session.startRunning()
    }
}

//MARK: AVCaptureVideoDataOutputSampleBufferDelegate
extension RealtimeAddonViewController {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection){
        
    }
}

