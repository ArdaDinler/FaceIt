//
//  EmotionViewController.swift
//  FaceIt
//
//  Created by Arda Dinler on 11/01/2017.
//  Copyright © 2017 Arda Dinler. All rights reserved.
//

import UIKit

class EmotionViewController: UIViewController {

    private let emotionalFaces: Dictionary<String,FacialExpression> = [
        "angry": FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
        "happy": FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
        "worried": FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk),
        "mischievious": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin)
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationvc = segue.destination
        if let navcon = destinationvc as? UINavigationController {
            destinationvc = navcon.visibleViewController ?? destinationvc
        }
        if let facevc = destinationvc as? FaceViewController { // cast to FaceViewController
            if let identifier = segue.identifier { // Check if nil
                if let expression = emotionalFaces[identifier] {
                    facevc.expression = expression
                    if let sendingButton = sender as? UIButton {
                        facevc.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
    }


}
