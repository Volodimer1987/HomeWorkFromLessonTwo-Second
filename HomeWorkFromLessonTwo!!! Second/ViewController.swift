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
        
        redSlider.value = 0.5
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        greenSlider.value = 0.5
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        blueSlider.value = 0.5
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
    mixedColorsFromSliderValue()
        redTextFieldForAddFromScreen.text = String(twoDigitAfterPoint(digit: redSlider.value))
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let defoultValue:Float = 0.0
        
        redSlider.value = Float(redTextFieldForAddFromScreen.text!) ?? defoultValue
        redStringColorLabel.text = Colors.red.rawValue +     "\(twoDigitAfterPoint(digit:Float(redTextFieldForAddFromScreen.text!) ?? defoultValue))"
        
        greenSlider.value = Float(greenTextFieldForAddFromScreen.text!) ?? defoultValue
        greenStringColorLabel.text = Colors.green.rawValue +     "\(twoDigitAfterPoint(digit:Float(greenTextFieldForAddFromScreen.text!) ?? defoultValue))"
        
        blueSlider.value = Float(blueTextFieldForAddFromScreen.text!) ?? defoultValue
        blueStringColorLabel.text = Colors.blue.rawValue +     "\(twoDigitAfterPoint(digit:Float(blueTextFieldForAddFromScreen.text!) ?? defoultValue))"
        
        mixedColorsFromSliderValue()
        
        
    }
}

extension UIViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


