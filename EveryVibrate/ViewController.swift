//
//  ViewController.swift
//  EveryVibrate
//
//  Created by 장기화 on 2021/04/13.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btn)
        
        btn.widthAnchor.constraint(equalToConstant: 128).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 128).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        btn.setTitle("Tap here!", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc func tapped() {
        i += 1
        print("Running \(i)")
        
        switch i {
        
        case 1:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        case 2:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case 3:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case 4:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case 5:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case 6:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case 7:
            if #available(iOS 13.0, *) {
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            }
        case 8:
            if #available(iOS 13.0, *) {
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
            }
        case 9:
            UISelectionFeedbackGenerator().selectionChanged()
        default:
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            i = 0
        }
    }
}
