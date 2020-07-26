//
//  MainViewController.swift
//  MoPubGDPRExample
//
//  Created by John Codeos on 7/1/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var gdprResultsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        MyMoPub(adunit: Constant.BANNER_AD_UNIT, currentVC: self)

        self.gdprResultsLabel.text = "Show ad"
    }
}
