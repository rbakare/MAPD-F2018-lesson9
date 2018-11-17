//
//  FontInfoViewController.swift
//  Fonts_Week_10
//
//  Created by macbook on 16.11.2018.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
   

    var font: UIFont!
    var favorite: Bool = false
    
    @IBOutlet weak var fontSampleLabel: UILabel!
    
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    
    
    fontSampleLabel.font = font
    fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsItUuVv"
    + "WwXxYyZz 0123456789"
        
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.isOn = favorite
 //  fontSizeLabel.text  = "\(Int(font.pointSize))"
 //  favoriteSizeLabel.text = "\(Int(newSize))"
}

    
    @IBAction func slideFontSize(_ slider: UISlider) {
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    @IBAction func toggleFavorite(_ sender: UISwitch) {
        let favoritesList = FavoritesList.sharedFavoritesList
        if sender.isOn {
            favoritesList.addFavorites(fontName: font.fontName)
        } else {
            favoritesList.removeFavorites(fontName: font.fontName)
        }
    }
    
    
    
   
   

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


