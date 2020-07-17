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
    
    private func mixedColorsFromSliderValue () {
        viewOfMixedColors.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

        redStringColorLabel.text   =  " Red :       \(redSlider.value)"
        greenStringColorLabel.text =  " Green :   \(greenSlider.value)"
        blueStringColorLabel.text   = " Blue :     \(blueSlider.value)"

        redStringColorLabel.textColor = .white
        greenStringColorLabel.textColor = .white
        blueStringColorLabel.textColor = .white
        
        labelShowResultRed.text = "\(redSlider.value)"
        labelShowResultBlue.text = "\(blueSlider.value)"
        labelShowResultGreen.text = "\(greenSlider.value)"
        
        
        labelShowResultGreen.backgroundColor = .white
        labelShowResultBlue.backgroundColor = .white
        labelShowResultRed.backgroundColor = .white
        
        viewOfMixedColors.layer.cornerRadius = 10
        
        labelShowResultRed.layer.masksToBounds = true
        labelShowResultGreen.layer.masksToBounds = true
        labelShowResultBlue.layer.masksToBounds = true
        
        labelShowResultRed.layer.cornerRadius = 6
        labelShowResultGreen.layer.cornerRadius = 6
        labelShowResultBlue.layer.cornerRadius = 6
    }

    @IBAction func redLabelActionSlider() {
        
    redStringColorLabel.text = " Red :       \(toDigitAfterPoint(digit:redSlider.value))"
    labelShowResultRed.text = "\(toDigitAfterPoint(digit:redSlider.value))"
    mixedColorsFromSliderValue()
        
    }
    @IBAction func greenLabelActionSlider() {
        
    greenStringColorLabel.text = " Green :   \(toDigitAfterPoint(digit:greenSlider.value))"
    labelShowResultGreen.text = "\(toDigitAfterPoint(digit:greenSlider.value))"
    mixedColorsFromSliderValue()
        
    }
    
    @IBAction func blueLabelActionSlider() {
        
    blueStringColorLabel.text = " Blue :     \(toDigitAfterPoint(digit:blueSlider.value))"
    labelShowResultBlue.text = "\(toDigitAfterPoint(digit:blueSlider.value))"
    mixedColorsFromSliderValue()
        
    }
    
}



