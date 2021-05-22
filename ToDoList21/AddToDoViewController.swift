//
//  AddToDoViewController.swift
//  ToDoList21
//
//  Created by Omar Mendez on 5/15/21.
//  Copyright © 2021 Omar Mendez. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRoundButton(addButton)
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            // we are creating a new ToDoCD object here, naming it toDo
            let toDoObj = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            
            
        
        //Create ToDo object named toDoObj
        //let toDoObj = ToDo()
        
        //If there's text in the titleTextField, set the object's name and important fields
            if let titleText = titleTextField.text{
                toDoObj.name = titleText
                toDoObj.important = importantSwitch.isOn
            }
            
            try? context.save()
        
        //add this new toDoObj to array in previous View Controller(ToDoViewController)
        //previousVC.toDosArr.append(toDoObj)
        //previousVC.tableView.reloadData()
        //Pop back to the previous view when the user taps the Add button
            navigationController?.popViewController(animated: true)
        }
    }
    
    func makeRoundButton(_ button : AnyObject){
        button.layer?.cornerRadius = button.frame.size.width / 2
        button.layer?.masksToBounds = true
    }
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // Pass the selected object to the new view controller.
    }
    */

}
