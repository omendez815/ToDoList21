//
//  CompleteToDoViewController.swift
//  ToDoList21
//
//  Created by Omar Mendez on 5/16/21.
//  Copyright © 2021 Omar Mendez. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData?
    
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //“if there is a selectedToDo, we’ll go ahead and pass it the info it needs; otherwise, we’ll set it equal to nil”.
        titleLabel.text = selectedToDo?.name
        // Do any additional setup after loading the view.
        
        makeRoundButton(doneButton)
    }
    

    @IBAction func completeBttnTapped(_ sender: Any) {
        //access Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            //if the todo exists, delete it and go back to previous view controller
            if let theToDo = selectedToDo {
            context.delete(theToDo)
            navigationController?.popViewController(animated: true)
          }
        }
        
    }
    
    func makeRoundButton(_ button : AnyObject){
        button.layer?.cornerRadius = button.frame.size.width / 2
        button.layer?.masksToBounds = true
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
