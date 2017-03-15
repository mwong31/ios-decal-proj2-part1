//
//  CategoryViewController.swift
//  snapChatProject
//
//  Created by Marisa Wong on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var threadTable: UITableView!
    
    @IBOutlet weak var selectedFeed: UILabel!
    
    var selectedImage : UIImage?
    var categoryThreads : [String]?
    var selectedCategory : String?
    var currSnap : Snaps?
    
    @IBAction func goPost(_ sender: Any) {
        if selectedFeed.text!.isEmpty == false {
            let alert = UIAlertController(title: "", message: "Picture has been successfully added to selected feed.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "backToPicker", sender: self) }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "", message: "Please select a feed to post your picture to.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadTable.dataSource = self
        threadTable.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryThreads!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexNum = indexPath.row
        let threadName : String = threadNames[indexNum]
        let currName = tableView.dequeueReusableCell(withIdentifier: "threadName", for: indexPath) as! CategoryTableViewCell
        currName.threadName.text = threadName
        return currName
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryIndex = indexPath.row
        selectedCategory = threadNames[categoryIndex]
        selectedFeed.text = threadNames[categoryIndex]
        currSnap = Snaps(sender:"Marisa Wong", timeAgo: NSDate(), pic: selectedImage!, feed: selectedCategory!)
        threads[selectedCategory!]?.append(currSnap!)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedThread" {
            if let dest = segue.destination as? FeedViewController {
                print("about to segue")
            }
        }
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
