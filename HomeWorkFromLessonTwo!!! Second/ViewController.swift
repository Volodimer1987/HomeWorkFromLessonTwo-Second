import UIKit

enum Colors: String {
    case red  = " Red :      "
    case green = " Green :  "
    case blue = " Blue :   "
}

class ViewController: UIViewController  {
    
    @IBOutlet var redTextFieldForAddFromScreen: UITextField!
    @IBOutlet var greenTextFieldForAddFromScreen: UITextField!
    @IBOutlet var blueTextFieldForAddFromScreen: UITextField!
    
    @IBOutlet var viewOfMixedColors: UIView!
    
    @IBOutlet var redStringColorLabel: UILabel!
    @IBOutlet var greenStringColorLabel: UILabel!
    @IBOutlet var blueStringColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    private func adjustingAllInStoryBoard() {
        view.backgroundColor = .systemBlue
              
              redStringColorLabel.backgroundColor = view.backgroundColor
              greenStringColorLabel.backgroundColor = view.backgroundColor
              blueStringColorLabel.backgroundColor = view.backgroundColor
              
              redSlider.value = 0.0
              redSlider.minimumValue = 0
              redSlider.maximumValue = 1
              
              greenSlider.value = 0.0
              greenSlider.minimumValue = 0
              greenSlider.maximumValue = 1
              
              blueSlider.value = 0.0
              blueSlider.minimumValue = 0
              blueSlider.maximumValue = 1
              
              redSlider.minimumTrackTintColor = .red
              redSlider.maximumTrackTintColor = .systemGray6
              
              greenSlider.minimumTrackTintColor = .green
              greenSlider.maximumTrackTintColor = .systemGray6
              
              blueSlider.minimumTrackTintColor = .blue
              blueSlider.maximumTrackTintColor = .systemGray6

              redStringColorLabel.text   = Colors.red.rawValue + "\(redSlider.value)"
              greenStringColorLabel.text =  Colors.green.rawValue + "\(greenSlider.value)"
              blueStringColorLabel.text   = Colors.blue.rawValue + "  \(blueSlider.value)"

              redStringColorLabel.textColor = .white
              greenStringColorLabel.textColor = .white
              blueStringColorLabel.textColor = .white
              
              redTextFieldForAddFromScreen.text = "\(redSlider.value)"
              blueTextFieldForAddFromScreen.text = "\(blueSlider.value)"
              greenTextFieldForAddFromScreen.text = "\(greenSlider.value)"
              
              
              greenTextFieldForAddFromScreen.backgroundColor = .white
              blueTextFieldForAddFromScreen.backgroundColor = .white
              redTextFieldForAddFromScreen.backgroundColor = .white
              
              viewOfMixedColors.layer.cornerRadius = 10
              mixedColorsFromSliderValue()
        
    }
    

    private func twoDigitAfterPoint(digit:Float) -> Float {
        return Float(round(100*digit)/100)
        
    }
    
    private func mixedColorsFromSliderValue () {
        viewOfMixedColors.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    
    private func configureTapGesture () {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    
    @objc func handleTap () {
        print("Handle Tap was called")
        view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        redTextFieldForAddFromScreen.delegate = self
        greenTextFieldForAddFromScreen.delegate = self
        blueTextFieldForAddFromScreen.delegate = self
        
      
        configureTapGesture()
        adjustingAllInStoryBoard()

    }
    
    @IBAction func fromSlidersTooTexts(_ sender: UISlider) {
        
        switch sender.tag {
            
        case 0:
            redStringColorLabel.text = Colors.red.rawValue + "\(string(from: sender))"
            redTextFieldForAddFromScreen.text = string(from: sender)
            
        case 1:
            greenStringColorLabel.text = Colors.green.rawValue + "\(string(from: sender))"
            greenTextFieldForAddFromScreen.text = string(from: sender)
            
        case 2:
            blueStringColorLabel.text = Colors.blue.rawValue + "\(string(from: sender))"
            blueTextFieldForAddFromScreen.text = string(from: sender)
            
        default:
            break
        }
        
        mixedColorsFromSliderValue()
    }
    

  private  func lessOrMoreFloat(inside:UITextField) -> Float? {
        var backBool:Float?
        if let a = Float(inside.text!)  {
            if  a >= 0 && a <= 1 { backBool = a
                
            } else { showAlert(title: " Limit error", message: "Min: 0.0 , Max:1")}
            
        } else {
            showAlert(title: "Error", message: "Enter please only digits")
        }
        
         return backBool
    }
}

extension ViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
 func textFieldDidEndEditing(_ textField: UITextField) {


    switch textField.tag {
        case 0:
            
            if textField.text == "" { textField.text = "\(string(from: redSlider))" ; return }

              textField.text = "\(twoDigitAfterPoint(digit: lessOrMoreFloat(inside: textField) ?? redSlider.value))"
              redSlider.value = Float(redTextFieldForAddFromScreen.text!) ?? 0.0
              redStringColorLabel.text = Colors.red.rawValue +     "\(twoDigitAfterPoint(digit:Float(redTextFieldForAddFromScreen.text!) ?? 0.0))"

        case 1:

              if textField.text == "" {textField.text = "\(string(from: redSlider))" ; return }

             textField.text = "\(twoDigitAfterPoint(digit: lessOrMoreFloat(inside: textField) ?? greenSlider.value))"
             greenSlider.value = Float(textField.text!) ?? 0.0
             greenStringColorLabel.text = Colors.green.rawValue +     "\(twoDigitAfterPoint(digit:Float(textField.text!) ?? 0.0))"

        case 2 :

              if textField.text == "" {textField.text = "\(string(from: blueSlider))" ; return }
              
            textField.text = "\(twoDigitAfterPoint(digit: lessOrMoreFloat(inside: textField) ?? blueSlider.value))"
             blueSlider.value = Float(textField.text!) ?? 0.0
             blueStringColorLabel.text = Colors.blue.rawValue +     "\(twoDigitAfterPoint(digit:Float(textField.text!) ?? 0.0))"

        default:break

        }

        mixedColorsFromSliderValue()
        
    }
}

extension ViewController {

    private func showAlert(title:String,message:String ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
     
    }
}


