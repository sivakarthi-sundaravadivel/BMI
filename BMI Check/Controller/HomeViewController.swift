//
//  ViewController.swift
//  BMI Check
//
//  Created by s.sivakarthi on 08/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var heightText: UILabel!
    
    
    @IBOutlet var weightText: UILabel!
    
    @IBOutlet var resultText: UILabel!
    @IBOutlet var CalculateButton: UIButton!
    
    @IBOutlet var heightSlider: UISlider!{
        didSet{
            heightSlider.minimumValue = 1
            heightSlider.maximumValue = 300
        }
    }
    
    
    @IBOutlet var checkBodyType: UIButton!
    
    @IBOutlet var weightSlider: UISlider!{
        didSet{
            weightSlider.minimumValue = 1
            weightSlider.maximumValue = 150
        }
    }
    
    @IBAction func CheckBodyTypeButton(_ sender: Any) {
        if resultText.text != ""{
            performSegue(withIdentifier: "segue", sender: self)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let BodyTypeController = segue.destination as! BodyTypeViewController
        BodyTypeController.mySrting = resultText.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderAction(_ sender: Any) {
        heightText.text = "\(heightSlider.value.rounded())"
        
    }
    
    @IBAction func weightSliderAction(_ sender: Any) {
        weightText.text = "\(weightSlider.value.rounded())"
    }
    
    func calculateBMI(bmi: Double)-> (height: Double , weight: Double){

        let weightInMeter = Double(weightSlider.value)*1000
        
        let heightInSqure = Double(heightSlider.value)*Double(heightSlider.value)
        
        
        _ = weightInMeter / heightInSqure
    
        return (weightInMeter, heightInSqure)
    }
    
    
    @IBAction func CalculateButtonAction(_ sender: Any) {
        
        let heightInSqure = Double(heightSlider.value)*Double(heightSlider.value)
        
        
        let weightinKg = weightSlider.value
        
        let heightInMeterSq = heightInSqure / 10000
        
        
        let bmiResult = Double(weightinKg) / Double(heightInMeterSq)
        
        resultText.text = " \(bmiResult.rounded())"
    }
    
    
    @IBAction func modeChangeButton(_ sender: Any) {
        openSettings()
    }
    
    func openSettings(){
            guard let settingURL = URL(string: UIApplication.openSettingsURLString) else {return}
            if UIApplication.shared.canOpenURL(settingURL){
                UIApplication.shared.open(settingURL, options: [:]) { success in
                    print("success: ", success)
                }
            }
        }
    
    
    
}

