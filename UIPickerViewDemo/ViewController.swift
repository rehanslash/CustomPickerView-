//
//  ViewController.swift
//  UIPickerViewDemo
//
//  Created by HigherVisibility on 07/02/2018.
//  Copyright © 2018 ahmedHigherVisibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UIPickerViewDelegate,
UIPickerViewDataSource {

    
    
    @IBOutlet weak var picker: UIPickerView!
    
     var pickerData: [String] = [String]()
    
    var data: [String] = ["60°", "61°", "62°", "63°", "64°", "65°","66°", "67°", "65°", "63°", "59°", "57°"]
    var times: [String] = ["9:00", "10:00", "11:00", "12:00", "13:00", "14:00","15:00", "16:00", "17:00", "18:00", "19:00", "20:00"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        picker.frame = CGRect(x: -100, y: view.frame.height - 120, width: view.frame.width + 200, height: 100)
        
        data.reverse()
        times.reverse()
        
        self.picker.delegate = self as UIPickerViewDelegate
        self.picker.dataSource = self as UIPickerViewDataSource
        // pickerData = ["Saloon", "Estate", "MPV", "6 seater", "5 Seater", "8 Seater"]
        
         picker.selectRow(data.count - 3, inComponent: 0, animated: false)
        
        func viewDidLayoutSubviews() {
            for subview in picker.subviews{
                if subview.frame.origin.y != 0{
                    subview.isHidden = true
                }
            }
        }
        
    }

    
 
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
       return data.count
    }
    
    
    // The number of columns of data
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {

         return 1
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        let label = UILabel(frame: CGRect(x: 5, y: 0, width: view.frame.width, height: view.frame.height))
        label.text = data[row]
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 45, weight: UIFont.Weight.thin)
        view.addSubview(label)
        
        let time = UILabel(frame: CGRect(x: 0, y: 85, width: view.frame.width, height: 15))
        time.text = times[row]
        time.textAlignment = .center
        time.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        view.addSubview(time)
        
        view.transform = CGAffineTransform(rotationAngle: -90 * (.pi/180))
        
        return view
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

