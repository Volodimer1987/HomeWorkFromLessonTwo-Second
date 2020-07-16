

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


    }

    @IBAction func redLabelActionSlider() {
        
    }
    @IBAction func greenLabelActionSlider() {
        
    }
    
    @IBAction func blueLabelActionSlider() {
        
    }
    
}

