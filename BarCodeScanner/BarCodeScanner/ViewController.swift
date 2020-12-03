//
//  ViewController.swift
//  BarCodeScanner
//
//  Created by 1 on 11/27/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scanBarButton: UIButton!
    @IBOutlet weak var scanTextField: UITextField!
    let scannerViewController = ScannerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        updateUI()
        scannerViewController.delegate = self
    }
}

extension ViewController: ScannerViewDelegate {
    func didFindScannedText(text: String) {
        scanTextField.text = text
    }
}

extension ViewController {
    private func updateUI() {
        scanBarButton.backgroundColor = UIColor.systemYellow
        scanBarButton.setTitle("Scan Bar Code", for: .normal)
        scanBarButton.setTitleColor(UIColor.white, for: .normal)
        scanBarButton.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Thin" , size: 25)
        scanBarButton.addTarget(self, action: #selector(scanBarTapped), for: .touchUpInside)
        
        scanTextField.text = "Default"
        scanTextField.textAlignment = .center
        scanTextField.textColor = UIColor.white
        scanTextField.font = (UIFont(name: "AppleSDGothicNeo-Bold", size: 25))
    }
    
    @objc func scanBarTapped() {
        self.navigationController?.pushViewController(scannerViewController, animated: true)
    }
}

