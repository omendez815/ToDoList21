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
    var toDosArr : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set ToDOs array to the array returned by createToDos()
        //toDosArr = createToDos()
    }
    
    //function will ensure ToDo List always reflects changes in Core Data???
    override func viewWillAppear(_ animated: Bool) {
      getToDos()
    }
    
    /* Old function to manually populate the ToDo array
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
    }*/
    
    func getToDos(){
        //access CoreData
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
                toDosArr = coreDataToDos
                tableView.reloadData()
            }
        
        }
    }

    // MARK: - Table view data source

    //HOW MANY ROWS WILL WE HAVE???
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //how many rows will we have? as many toDo objects  as we have
        return toDosArr.count
        
    }

    //WHAT SHOULD DISPLAY IN EACH ROW???
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell at current row
        let toDoItem = toDosArr[indexPath.row]
        
        if let name = toDoItem.name{
            if toDoItem.important{
                cell.textLabel?.text = " ‼️ " + name
            }else{
                cell.textLabel?.text = name
            }
        }
        return cell
    }
    

   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        //select a toDoObject from the list
        let toDoObj = toDosArr[indexPath.row]
        
        //move to CompleteViewController with selected toDO object
        performSegue(withIdentifier: "moveToComplete", sender: toDoObj)
        
    }
    
    // MARK: - Navigation
     //KEEP
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let addVC = segue.destination as? AddToDoViewController{
            addVC.previousVC = self
        }
        
        //if we're going to complete to do VC...
        if let completeVC = segue.destination as? CompleteToDoViewController{
            if let toDo = sender as? ToDoCoreData{
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        // Pass the selected object to the new view controller.
        
        
    }
}
