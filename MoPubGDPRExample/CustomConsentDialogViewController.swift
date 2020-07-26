//
//  CustomConsentDialogViewController.swift
//  MoPubGDPRExample
//
//  Created by John Codeos on 7/1/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import MoPub
import UIKit

class CustomConsentDialogViewController: UIViewController {
    @IBOutlet var gdprTitleLabel: UILabel!
    
    @IBOutlet var gdprMainLabel: UILabel!
    
    @IBOutlet var gdprNoteLabel: UILabel!
    
    @IBOutlet var gdprFooterLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gdprTitleLabel.text = "Personalize Your Experience"
        
        gdprMainLabel.text = Constant.MAIN_TEXT
        
        gdprNoteLabel.text = Constant.NOTE_TEXT
        
        gdprFooterLabel.text = Constant.FOOTER_TEXT
    }
    
    @IBAction func gdprAgreeBtn(_ sender: UIButton) {
        // Call this to let MoPub know the user has granted consent
        MoPub.sharedInstance().grantConsent()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gdprDisagreeBtn(_ sender: UIButton) {
        // Call this to let MoPub know the user has revoked consent
        MoPub.sharedInstance().revokeConsent()
        dismiss(animated: true, completion: nil)
    }
}
