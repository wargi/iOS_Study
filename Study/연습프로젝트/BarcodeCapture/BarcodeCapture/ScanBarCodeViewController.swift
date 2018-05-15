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
    
    var imgView: UIImageView!
    var barcodeView: UIView!
    let device = AVCaptureDevice.default(for: AVMediaType.video)
    var captureSession = AVCaptureSession()
    let captureSessionQueue = DispatchQueue(label: AVCaptureSession.self.description(), attributes: [], target: nil)
    var barcode: String?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoOrientation: AVCaptureVideoOrientation
        
        imgView = UIImageView()
        imgView.frame = view.bounds
        imgView.image = UIImage(named: "barcodeCameraImage")
        imgView.isUserInteractionEnabled = false
        
        barcodeView = UIView()
        barcodeView.frame = CGRect(x: 143, y: 327, width: 124, height: 200)
        
        cameraOpen()
        
        switch UIApplication.shared.statusBarOrientation {
        case .portrait:
            videoOrientation = .portrait
            
        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown
            
        case .landscapeLeft:
            videoOrientation = .landscapeLeft
            
        case .landscapeRight:
            videoOrientation = .landscapeRight
            
        default:
            videoOrientation = .portrait
        }
        self.previewLayer?.connection?.videoOrientation = videoOrientation
    }
    
    func cameraOpen() {
        captureSession.beginConfiguration()
        
        let input = try? AVCaptureDeviceInput(device: device!)
        
        if self.captureSession.canAddInput(input!) {
            self.captureSession.addInput(input!)
        }
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        if let videoPreviewLayer = self.previewLayer {
            
//            let videoPreviewRect = videoPreviewLayer.layerRectConverted(fromMetadataOutputRect: ).standardized
            
            videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
            videoPreviewLayer.frame = barcodeView.bounds
            
            barcodeView.layer.addSublayer(videoPreviewLayer)
            view.addSubview(barcodeView)
            view.addSubview(imgView)
            
            

        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if self.captureSession.canAddOutput(metadataOutput) {
            self.captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.qr]

            
        }
        
        captureSession.commitConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.white
        
        captureSessionQueue.async {
            self.captureSession.startRunning()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        captureSessionQueue.async {
            self.captureSession.stopRunning()
        }
       
    }
}

extension ScanBarCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadata in metadataObjects {
            let readMetadata = metadata as! AVMetadataMachineReadableCodeObject
            let code = readMetadata.stringValue
            
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "DiscoverdViewController") as! DiscoverdViewController
            nextVC.inputBarcode = code
            self.present(nextVC, animated: true)
            
        }
    }
}
