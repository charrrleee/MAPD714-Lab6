//
//  MultiComponentPickerViewController.swift
//  MAPD714-Lab6
//
//  Created by Charlene Cheung on 20/10/2022.
//

import UIKit

class MultiComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var MultiPickerControl: UIPickerView!
    
    let Red = ColourChannel.Red
    let Blue = ColourChannel.Blue
    let Green = ColourChannel.Green
    
    let MAX = 9
    
    var ValueArray: [String] = []
    
    var selectMap: [Int: Int] = [0:0, 1:0, 2:0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildValueArray()
        
        MultiPickerControl.selectRow(MAX, inComponent: Red.rawValue, animated: true)
        MultiPickerControl.selectRow(MAX, inComponent: Blue.rawValue, animated: true)
        MultiPickerControl.selectRow(MAX, inComponent: Green.rawValue, animated: true)
    }
    
    func buildValueArray()
    {
        for index in stride(from: MAX , through: 0, by: -1)
        {
            ValueArray.append(String(index))
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return MAX + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return ValueArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let val = ValueArray[row]
        selectMap[component] = Int(val)
    }
    
    @IBAction func SelectButton_Pressed(_ sender: UIButton)
    {
        for (_, v) in selectMap {
            if v != Int(ValueArray[0]) { return }
        }
        
        let RedChannelIndex = MultiPickerControl.selectedRow(inComponent: Red.rawValue)
        let BlueChannelIndex = MultiPickerControl.selectedRow(inComponent: Blue.rawValue)
        let GreenChannelIndex = MultiPickerControl.selectedRow(inComponent: Green.rawValue)

        let RedChannel = CGFloat((ValueArray[RedChannelIndex] as NSString).floatValue) / 255.0
        let BlueChannel = CGFloat((ValueArray[BlueChannelIndex] as NSString).floatValue) / 255.0
        let GreenChannel = CGFloat((ValueArray[GreenChannelIndex] as NSString).floatValue) / 255.0


        let picker = UIColorPickerViewController()
        picker.selectedColor = UIColor(red: RedChannel, green: BlueChannel, blue: GreenChannel, alpha: 1.0)

        self.present(picker, animated: true, completion: nil)

    }
    
}
