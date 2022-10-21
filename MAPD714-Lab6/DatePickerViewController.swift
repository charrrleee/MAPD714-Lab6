import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var DatePickerControl: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("DatePickerViewController")
        let date = NSDate()
        DatePickerControl.setDate(date as Date, animated: false)
    }

    @IBAction func selectButton_Pressed(_ sender: Any)
    {
        
    }
}

