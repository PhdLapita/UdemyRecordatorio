//
//  ListaViewController.swift
//  UdemyRecordatorio
//
//  Created by Bear on 26/12/16.
//  Copyright © 2016 BearCreekMining. All rights reserved.
//

import UIKit

class ListaViewController: UITableViewController {

    var taskManager =  TaskManager.sharedInstance
    @IBAction func addTask(_ sender: UIBarButtonItem){
        let alertController = UIAlertController(title: "nueva tarea", message: "Nombre de la tarea", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let alertAction = UIAlertAction(title: "Guardar", style: .default){(alertAction) in
            if let textFieldText = alertController.textFields?.first?.text{
                self.taskManager.tasks.append(["title": textFieldText])
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskManager.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as!  TaskCell
            let task = taskManager.tasks[indexPath.row]
            cell.txtTask.text = task["title"]
        if let image = task["icon"]{
            cell.imgTask.image = UIImage(named: image)
        }else{
            cell.imgTask.image = UIImage(named: "img_no_icon")
        }
        return cell
        }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let complete = UITableViewRowAction(style: .normal, title: "Completar") { (action,indexPath)
            in
            self.taskManager.tasks.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        complete.backgroundColor = #colorLiteral(red: 0.8, green: 0.9725490196, blue: 0.9529411765, alpha: 1)
        return[complete]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let destinationVC = segue.destination as! IconsViewController
                let selectedTask = taskManager.tasks[indexPath.row]
                destinationVC.headerTitleString = selectedTask["title"]
                destinationVC.selectedTask = indexPath.row
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
}
