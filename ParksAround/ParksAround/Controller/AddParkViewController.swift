//
//  AddParkViewController.swift
//  ParksAround
//
//  Created by Андрей  on 14.06.2022.
//

import UIKit

class AddParkViewController: UITableViewController {

    @IBOutlet weak var imageOfPark: UIImageView!
    
    let photoIcon = UIImage(named: "photoIcon")
    let cameraIcon = UIImage(named: "cameraIcon")
    
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
            uploadPictureAlert()
        } else {
            view.endEditing(true)
        }
    }
}



// MARK: ImageUpload
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
        imageOfPark.contentMode = .scaleAspectFill
        imageOfPark.clipsToBounds = true
        dismiss(animated: true)
    }
}
