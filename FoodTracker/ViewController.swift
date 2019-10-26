//
//  ViewController.swift
//  FoodTracker
//
//  Created by jodia luxcon on 2019/10/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
//MARK:Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        
    }
    
    //MARK:UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        mealNameLabel.text = textField.text
    }
    //MARK:UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss this picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //The info dictionary may contain multiple representations of this image.You want to use the original
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image,but was provided the following:\(info)")
            }
            //Set photoImageView to display the selected image
            photoImageView.image = selectedImage
            //Dismiss the picker
            dismiss(animated: true, completion: nil)
        
        
    }
    
//MARK:Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func test(_ sender: UIButton) {
        mealNameLabel.text = "test"
    }
    //选择图片
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //当用户在输入文字时点击了图片，可以将输入框的焦点取消并隐藏
        nameTextField.resignFirstResponder()
        //create an image picker controller
        //UIImagePickerController is a view controller that lets a user pick media form their photo library
        let imagePickerController = UIImagePickerController()
        //only allow photos to be picked,not taken
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        // Make sure ViewController is notified when the user picks an image.
        present(imagePickerController,animated: true,completion: nil)
    }
    
    

}

