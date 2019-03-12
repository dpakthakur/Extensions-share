//
//  BlueViewController.swift
//  ExtensionsPOC
//
//  Created by Deepak Thakur on 10/03/19.
//  Copyright © 2019 Deepak Thakur. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    let suiteName = "group.extensionspoc.share";
    let blueDefaultKey = "BlueColorImage";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let prefs = UserDefaults(suiteName: suiteName) {
            if let imageData = prefs.object(forKey: blueDefaultKey) as? Data {
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: imageData);
                }
            }
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
