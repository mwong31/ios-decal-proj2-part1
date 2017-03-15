//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Marisa Wong on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var feedTable: UITableView!
    var selectedCell : FeedTableViewCell?

    struct Objects {
        
        var sectionName : String!
        var sectionObjects : [Snaps]!
    }
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self
        
        for (key, value) in threads {
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "getMessage", for: indexPath) as! FeedTableViewCell
        
        cell.senderName.text = objectArray[indexPath.section].sectionObjects![indexPath.row].sender
        cell.redButton.image = objectArray[indexPath.section].sectionObjects![indexPath.row].unread
        
        let timeInterval = objectArray[indexPath.section].sectionObjects![indexPath.row].timeAgo?.timeIntervalSinceNow
        let negTimeString = timeInterval?.description
        let arr = negTimeString?.components(separatedBy: ".")
        let negTimeNum = Int((arr?[0])!)
        let negTimeMin = negTimeNum! / 60
        let posTimeMin = negTimeMin + (-2) * negTimeMin
        cell.timeSent.text = "\(posTimeMin) minutes ago"
        
        cell.holdImage = objectArray[indexPath.section].sectionObjects![indexPath.row].pic
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FeedTableViewCell
        selectedCell = cell
        if (cell.redButton.image == #imageLiteral(resourceName: "unread")) {
            cell.redButton.image = #imageLiteral(resourceName: "read")
            performSegue(withIdentifier: "seeSnap", sender: self)
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeSnap" {
            if let dest = segue.destination as? DisplaySnapViewController {
                dest.getImage = selectedCell?.holdImage
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using s egue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
