//
//  CollectionViewCell.swift
//  PokeDex
//
//  Created by user212276 on 1/11/22.
//

import UIKit

//Celula da Collection View
class PokeCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelId: UILabel!
    
    //Instancia da struct Poke em uma variavel
    var poke : Poke!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 6
        layer.borderWidth = 1
        
    }
    
    //Funçao de hex para UiColor
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //Funçao para configurar cada Cell
    func configureCell(poke: Poke){
        self.poke = poke
        
        labelName.text = self.poke.nome.capitalized
        labelName.backgroundColor = hexStringToUIColor(hex: self.poke.cor)
        layer.borderColor = hexStringToUIColor(hex: self.poke.cor).cgColor
        
        if poke.linkImg != nil {
            imageView.download(from: poke.linkImg ?? "") }
        
        labelId.text = "#00" + String(self.poke.id)
        labelId.textColor = hexStringToUIColor(hex: self.poke.cor)
        
    }
}
