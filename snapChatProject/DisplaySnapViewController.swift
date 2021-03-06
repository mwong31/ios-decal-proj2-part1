//
//  DisplaySnapViewController.swift
//  snapChatProject
//
//  Created by Marisa Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class DisplaySnapViewController: UIViewController {

    
    @IBOutlet weak var currSnap: UIButton!

    @IBAction func tapSnap(_ sender: UIButton) {
        performSegue(withIdentifier: "backToPicker", sender: self)
    }
    
    var getImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currSnap.setBackgroundImage(getImage!, for: UIControlState.normal)
        currSnap.setTitle("", for: UIControlState.normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
