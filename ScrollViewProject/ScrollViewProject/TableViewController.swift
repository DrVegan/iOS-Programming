//
//  TableViewController.swift
//  ScrollViewProject
//
//  Created by Daniel Freeman on 27/9/16.
//  Copyright © 2016 FreemanCorp. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    

    var personList = [Person]()
    var sections: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dan = Person(first: "Daniel", middle: "Robert", last: "Freeman")
        let bel = Person(first: "Belinda", last: "Nim", myAge: 30)
        let bob = Person(first: "BOB", last: "DOVER", myAge: 100)
        let john = Person(first: "John", last: "Smith", myAge: 99)
        let tony = Person(first: "Tony", last: "Jones", myAge: 12)
        
        personList.append(dan)
        personList.append(bel)
        personList.append(bob)
        personList.append(john)
        personList.append(tony)
        
        sections = ["Section 1", "Section 2", "Section 3"]
        
        let IS: IndexSet = [1,2]
        
        tableView.insertSections(IS, with: .fade)
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return personList.count
    }

    

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
        
    }
    
    func tableView(tableView: UITableView!, viewForHeaderInSection section: Int) -> UIView!
    {
        let headerView = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 50))
        headerView.backgroundColor = UIColor.red
        
    
        return headerView
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        //sections[indexPath.section]
        
        
        cell.textLabel?.text = personList[indexPath.row].nameFirst
        cell.detailTextLabel?.text = personList[indexPath.row].nameLast
       
            
            
        switch personList[indexPath.row].nameLast {
        case "Freeman":
            cell.backgroundColor = UIColor.red
        case "Smith":
            cell.backgroundColor = UIColor.green
        case "Jones":
            cell.backgroundColor = UIColor.yellow
        default:
            print("Hello")
        }
        
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
