//
//  MainTableViewController.swift
//  firebaseSDK
//
//  Created by Karen Rodriguez on 4/21/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit
import Firebase

class MainTableViewController: UITableViewController {
    
    
    var ref: DatabaseReference! {
        return Database.database().reference()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let today = Date()
        self.ref.child("user/\(69420)/username").setValue("luhmao")
        self.ref.child("user/helloWorld/username").setValue("sample test")
        self.ref.child("user/helloWorld/date").setValue(String(today.timeIntervalSince1970))
        self.ref.child("user/helloWorld/dob").setValue("4/20/1969")
        
        let refHandle = ref.observe(.value) { (snapshot) in
            let postDict = snapshot.value as? [String: AnyObject] ?? [:]
            print(postDict)
        }
        
        
        self.ref.child("user/helloWorld/dob").setValue("potatoTomato")
        self.ref.child("user/\(69420)").removeValue()
        
        guard let key = ref.child("user").childByAutoId().key else { return }
        let data = [
            "helloWorld" : [
                "date"  :   "199999.200",
                "dob"   :   "4/4/4444",
                "username" : "dample changed"
            ]]

        let childUpdates = [ "user" : data]
        ref.updateChildValues(childUpdates)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
