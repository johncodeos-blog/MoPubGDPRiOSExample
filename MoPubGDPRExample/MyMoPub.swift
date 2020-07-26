//
//  MyMoPub.swift
//  MoPubGDPRExample
//
//  Created by John Codeos on 7/1/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import Foundation
import MoPub

class MyMoPub {
    var parentVC: UIViewController?
    
    @discardableResult
    init(adunit: String, currentVC: UIViewController) {
        parentVC = currentVC
        
        let sdkConfiguration = MPMoPubConfiguration(adUnitIdForAppInitialization: adunit)
        sdkConfiguration.loggingLevel = .debug
        sdkConfiguration.allowLegitimateInterest = false
        
        MoPub.sharedInstance().initializeSdk(with: sdkConfiguration) {
            /* MoPub SDK initialized.
             Check if you should show the consent dialog here, and make your ad requests. */
            print("MoPub SDK Initialized")
            self.GDPRConsent()
        }
    }
    
    func GDPRConsent() {
        let isGDPRApplicable = MoPub.sharedInstance().isGDPRApplicable
        if isGDPRApplicable == .no {
            print("This country covered by GDPR? No")
        } else if isGDPRApplicable == .unknown {
            print("This country covered by GDPR? Unknown")
        } else {
            print("This country covered by GDPR? Yes")
        }
        
        if MoPub.sharedInstance().shouldShowConsentDialog {
            // Open Custom Consent ViewController
            DispatchQueue.main.async {
                let customConstentVC = CustomConsentDialogViewController(nibName: CustomConsentDialogViewController.identifier, bundle: nil)
                customConstentVC.modalPresentationStyle = .overCurrentContext
                self.parentVC?.present(customConstentVC, animated: true, completion: nil)
            }
        }
    }
}
