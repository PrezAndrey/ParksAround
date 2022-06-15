//
//  AddParkViewController.swift
//  ParksAround
//
//  Created by Андрей  on 14.06.2022.
//

import UIKit

class AddParkViewController: UITableViewController {
    
    var newPark: Park?
    var imageIsChanged = false
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var imageOfPark: UIImageView!
    @IBOutlet weak var parkNameTF: UITextField!
    @IBOutlet weak var parkLocationTF: UITextField!
    @IBOutlet weak var workingHoursTF: UITextField!
    
    let photoIcon = UIImage(named: "photoIcon")
    let cameraIcon = UIImage(named: "cameraIcon")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        parkNameTF.addTarget(self, action: #selector(TFChanged), for: .editingChanged)
    }

    
    
    
    
    @IBAction func didCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func saveNewPark() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = imageOfPark.image
        } else {
            image = UIImage(named: "tree")
        }
        newPark = Park(name: parkNameTF.text!, image: image, parkImage: nil, location: parkLocationTF.text, openTime: workingHoursTF.text)
    }

    
}


// MARK: TextField Delegate
extension AddParkViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func TFChanged() {
        if parkNameTF.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}



// MARK: TableView Delegate
extension AddParkViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            uploadPictureAlert()
        } else {
            view.endEditing(true)
        }
    }
}



// MARK: Working with image
extension AddParkViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func uploadPictureAlert() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        photo.setValue(photoIcon, forKey: "image")
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        camera.setValue(cameraIcon, forKey: "image")
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        actionSheet.addAction(photo)
        actionSheet.addAction(camera)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
             
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            
            present(imagePicker, animated: true)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageOfPark.image = info[.editedImage] as? UIImage
        imageIsChanged = true
        imageOfPark.contentMode = .scaleAspectFill
        imageOfPark.clipsToBounds = true
        dismiss(animated: true)
    }
}
