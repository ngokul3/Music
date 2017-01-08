//
//  ViewController.swift
//  MusicSearch
//
//  Created by Gokula K Narasimhan on 1/7/17.
//  Copyright © 2017 Gokula K Narasimhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtSearchableEntity: UITextField!
    @IBOutlet weak var pkSearcableEntiries: UIPickerView!
    @IBAction func btnSearch(_ sender: Any) {
        
        
        let musicProcessor = MusicDataProcessor()
        
        let lstTrack = musicProcessor.ProcessMusicSearch(searchableEntity: txtSearchableEntity.text, searchItem: txtSearchItem.text)
    }
    @IBAction func txtSearchItemEndEdit(_ sender: Any) {
        
        pkSearcableEntiries.isHidden = true

    }
    
    @IBOutlet weak var txtSearchItem: UITextField!
    @IBAction func OntxtSearchablefieldEndEdit(_ sender: Any) {
        pkSearcableEntiries.isHidden = true
        
    }
    @IBAction func OntxtSearchablefieldBeginEdit(_ sender: Any) {
        
        pkSearcableEntiries.isHidden = false
    }
    
    @IBOutlet weak var btnSearch: UIButton!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.pickerData = [SearchableMusicEntity.ArtistName.description, SearchableMusicEntity.CollectionName.description, SearchableMusicEntity.TrackName.description]
        pkSearcableEntiries.isHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        txtSearchableEntity.text = pickerData[row]
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if(textField == txtSearchableEntity)
        {
            pkSearcableEntiries.isHidden = false
            return false
        }
        else
        {
            return true
        }
    }
    
    
    

}

