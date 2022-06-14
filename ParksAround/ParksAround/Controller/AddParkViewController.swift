//
//  AddParkViewController.swift
//  ParksAround
//
//  Created by Андрей  on 14.06.2022.
//

import UIKit

class AddParkViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func didCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
}


// MARK: TextFieldDelegate
extension AddParkViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



// MARK: TableViewDelegate
extension AddParkViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}
