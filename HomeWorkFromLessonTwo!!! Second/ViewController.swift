import UIKit

enum Colors: String {
    case red  = " Red :      "
    case green = " Green :  "
    case blue = " Blue :   "
}

class ViewController: UIViewController,UITextFieldDelegate  {
    
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
    
    @objc func handleTap () {
        print("Handle Tap was called")
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        redTextFieldForAddFromScreen.delegate = self
        greenTextFieldForAddFromScreen.delegate = self
        blueTextFieldForAddFromScreen.delegate = self
        
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
        
        configureTapGesture()

    }

    @IBAction func redLabelActionSlider() {
        
    redStringColorLabel.text = Colors.red.rawValue + "\(twoDigitAfterPoint(digit:redSlider.value))"
    redTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit:redSlider.value))"
    redTextFieldForAddFromScreen.text = String(twoDigitAfterPoint(digit: redSlider.value))
    mixedColorsFromSliderValue()

    }
    
    @IBAction func greenLabelActionSlider() {
        
    greenStringColorLabel.text = Colors.green.rawValue + "\(twoDigitAfterPoint(digit:greenSlider.value))"
    greenTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit:greenSlider.value))"
    mixedColorsFromSliderValue()
        
    }
    
    @IBAction func blueLabelActionSlider() {
        
    blueStringColorLabel.text = Colors.blue.rawValue +  "\(twoDigitAfterPoint(digit:blueSlider.value))"
    blueTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit:blueSlider.value))"
    mixedColorsFromSliderValue()
        
    
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        switch textField {
            
        case redTextFieldForAddFromScreen:
            
            if redTextFieldForAddFromScreen.text == "" {redTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit: redSlider.value))" ; return }
            
            redTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit: lessOrMoreFloat(inside: textField) ?? redSlider.value))"
              redSlider.value = Float(redTextFieldForAddFromScreen.text!) ?? 0.0
              redStringColorLabel.text = Colors.red.rawValue +     "\(twoDigitAfterPoint(digit:Float(redTextFieldForAddFromScreen.text!) ?? 0.0))"
            
        case greenTextFieldForAddFromScreen:

              if greenTextFieldForAddFromScreen.text == "" {greenTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit: greenSlider.value))" ; return }

              greenTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit: lessOrMoreFloat(inside: textField) ?? greenSlider.value))"
             greenSlider.value = Float(greenTextFieldForAddFromScreen.text!) ?? 0.0
             greenStringColorLabel.text = Colors.green.rawValue +     "\(twoDigitAfterPoint(digit:Float(greenTextFieldForAddFromScreen.text!) ?? 0.0))"
            
        case blueTextFieldForAddFromScreen :
            
              if blueTextFieldForAddFromScreen.text == "" {blueTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit: blueSlider.value))" ; return }
            
              blueTextFieldForAddFromScreen.text = "\(twoDigitAfterPoint(digit: lessOrMoreFloat(inside: blueTextFieldForAddFromScreen) ?? blueSlider.value))"
             blueSlider.value = Float(blueTextFieldForAddFromScreen.text!) ?? 0.0
             blueStringColorLabel.text = Colors.blue.rawValue +     "\(twoDigitAfterPoint(digit:Float(blueTextFieldForAddFromScreen.text!) ?? 0.0))"

        default:break
            
        }

        mixedColorsFromSliderValue()
    }
    
    func lessOrMoreFloat(inside:UITextField) -> Float? {
        var backBool:Float?
        if let a = Float(inside.text!)  {
            if  a >= 0 && a <= 1 { backBool = a
                
            } else { showAlert(title: " Limit error", message: "Min: 0 , Max: 1")}
            
        } else {
            showAlert(title: "Error", message: "Enter please only digits")
        }
        
         return backBool
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


