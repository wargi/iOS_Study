//
//  ScanViewController.swift
//  ToBeer
//
//  Created by Seo JaeHyeong on 23/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
/*
 // MARK: Handle Orientation Change
 
 override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
 super.viewWillTransition(to: size, with: coordinator)
 
 
 }
 */

import UIKit
import AVFoundation

class ScanBarCodeViewController: UIViewController {
    
    let device = AVCaptureDevice.default(for: AVMediaType.video)
    var captureSession = AVCaptureSession()
    
    var cameraView: CameraView!
    var barcode: String?
    
    override func loadView() {
        cameraView = CameraView()
        
        view = cameraView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraOpen()
        print("viewDidLoad")
    }
    
    func cameraOpen() {
        let input = try? AVCaptureDeviceInput(device: device!)
        
        if self.captureSession.canAddInput(input!) {
            print("canAddInput")
            self.captureSession.addInput(input!)
        }
        
        cameraView.layer.session = captureSession
        cameraView.layer.videoGravity = .resizeAspectFill
        
        let metadataOutput = AVCaptureMetadataOutput()
        if self.captureSession.canAddOutput(metadataOutput) {
            print("canAddOutput")
            self.captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            print("setMetadataObjectsDelegate")
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.qr]
            print("metadataObjectTypes")
            
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // Update camera orientation
        super.viewWillTransition(to: size, with: coordinator)
        
        
        let videoOrientation: AVCaptureVideoOrientation
        switch UIDevice.current.orientation {
        case .portrait:
            videoOrientation = .portrait
            
        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown
            
        case .landscapeLeft:
            videoOrientation = .landscapeRight
            
        case .landscapeRight:
            videoOrientation = .landscapeLeft
            
        default:
            videoOrientation = .portrait
        }
        
        self.cameraView.layer.connection?.videoOrientation = videoOrientation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.white
        
        print("viewWillAppear")
        captureSession.startRunning()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
        captureSession.stopRunning()
    }
}

extension ScanBarCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        print("metadataOutputDelegate")
        for metadata in metadataObjects {
            print("metadata For")
            let readMetadata = metadata as! AVMetadataMachineReadableCodeObject
            let code = readMetadata.stringValue
            
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "DiscoverdViewController") as! DiscoverdViewController
            nextVC.inputBarcode = code
            self.present(nextVC, animated: true)
            self.dismiss(animated: true, completion: nil)
            
        }
    }
}

class CameraView: UIView {
    
    override class var layerClass: AnyClass {
        get {
            return AVCaptureVideoPreviewLayer.self
        }
    }
    
    override var layer: AVCaptureVideoPreviewLayer {
        get {
            return super.layer as! AVCaptureVideoPreviewLayer
        }
    }
    
}
