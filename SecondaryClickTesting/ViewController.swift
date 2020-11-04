//
//  ViewController.swift
//  SecondaryClickTesting
//
//  Created by Áron Takács on 2020. 11. 04..
//

import UIKit

final class MyRecognizer: UITapGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        // NOTE: never called with secondary click
        super.touchesBegan(touches, with: event)
    }
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aTapGestureRecognizer = MyRecognizer()
        aTapGestureRecognizer.buttonMaskRequired = [.secondary]
        aTapGestureRecognizer.delegate = self
        
        view.addGestureRecognizer(aTapGestureRecognizer)
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // NOTE: never called with secondary click
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // NOTE: never called with secondary click
        super.touchesBegan(touches, with: event)
    }
}

