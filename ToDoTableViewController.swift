//
//  HomeTableViewController.swift
//  ToDoList21
//
//  Created by Omar Mendez on 5/14/21.
//  Copyright © 2021 Omar Mendez. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    //create an empty array that will hold ToDo objects
    var toDosArr : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set ToDOs array to the array returned by createToDos()
        toDosArr = createToDos()
    }
    
    func createToDos()->[ToDo]{
        //create a ToDo object named swift
        let swift = ToDo()
        //set name property of swift object
        swift.name = "Learn Swift"
        //set important property of swift object
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        //return an array of ToDo objects
        return [swift, dog]
    }

    // MARK: - Table view data source

    //HOW MANY ROWS WILL WE HAVE???
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //how many rows will we have? as many toDo objects  as we have
        //return toDosArr.count
        return 2;
    }

    //WHAT SHOULD DISPLAY IN EACH ROW???
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell at current row
        let toDoItem = toDosArr[indexPath.row]
        
        if toDoItem.important{
            cell.textLabel?.text = " ‼️ " + toDoItem.name
        }else{
            cell.textLabel?.text = toDoItem.name
        }
        
        return cell
    }
    

   
   
    /*
    // MARK: - Navigation
     //KEEP
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
