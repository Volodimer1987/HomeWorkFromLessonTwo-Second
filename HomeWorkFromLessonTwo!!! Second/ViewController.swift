

import UIKit



class ViewController: UIViewController {
    @IBOutlet var viewOfMixedColors: UIView!
    
    @IBOutlet var redStringColorLabel: UILabel!
    @IBOutlet var greenStringColorLabel: UILabel!
    @IBOutlet var blueStringColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var labelShowResultRed: UILabel!
    @IBOutlet var labelShowResultGreen: UILabel!
    @IBOutlet var labelShowResultBlue: UILabel!
    
    private func toDigitAfterPoint(digit:Float) -> Float {
        return Float(round(100*digit)/100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        redStringColorLabel.text = "Red : \(redSlider.value)"
        greenStringColorLabel.text = "Green : \(greenSlider.value)"
        blueStringColorLabel.text = "Blue : \(blueSlider.value)"
        
        labelShowResultRed.text = "\(redSlider.value)"
        labelShowResultBlue.text = "\(blueSlider.value)"
        labelShowResultGreen.text = "\(greenSlider.value)"
        
        labelShowResultGreen.backgroundColor = .white
        labelShowResultBlue.backgroundColor = .white
        labelShowResultRed.backgroundColor = .white
        

    }

    @IBAction func redLabelActionSlider() {
    redStringColorLabel.text = "Red :\(toDigitAfterPoint(digit:redSlider.value))"
    labelShowResultRed.text = "\(toDigitAfterPoint(digit:redSlider.value))"

        
    }
    @IBAction func greenLabelActionSlider() {
    greenStringColorLabel.text = "Green :\(toDigitAfterPoint(digit:greenSlider.value))"
    labelShowResultGreen.text = "\(toDigitAfterPoint(digit:greenSlider.value))"
        
    }
    
    @IBAction func blueLabelActionSlider() {
        blueStringColorLabel.text = "Blue : \(toDigitAfterPoint(digit:blueSlider.value))"
        labelShowResultBlue.text = "\(toDigitAfterPoint(digit:blueSlider.value))"

        
    }
    
}



