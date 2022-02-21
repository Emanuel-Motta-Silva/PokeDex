//
//  ViewController2.swift
//  PokeDex
//
//  Created by user212276 on 1/14/22.
//

import Foundation
import UIKit


class DetailPokemon : UIViewController {
    
    
    
    //Outlets
    
    //View Fundo
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewInfo: UIView!
    
    //Nome, id, tipo e sobre
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblType1: UILabel!
    @IBOutlet weak var lblType2: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    
    //peso,altura e habilidades
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblMove1: UILabel!
    @IBOutlet weak var lblMove2: UILabel!
    
    //label base
    @IBOutlet weak var lblBase: UILabel!
    
    //HP
    @IBOutlet weak var lblHP: UILabel!
    @IBOutlet weak var hp: UILabel!
    @IBOutlet weak var progressHP: UIProgressView!
    
    //ATK
    @IBOutlet weak var lblATK: UILabel!
    @IBOutlet weak var atk: UILabel!
    @IBOutlet weak var progressATK: UIProgressView!
    
    //DEF
    @IBOutlet weak var lblDEF: UILabel!
    @IBOutlet weak var def: UILabel!
    @IBOutlet weak var progressDEF: UIProgressView!
    
    //SATK
    @IBOutlet weak var lblSATK: UILabel!
    @IBOutlet weak var satk: UILabel!
    @IBOutlet weak var progressSATK: UIProgressView!
    
    //SDEF
    @IBOutlet weak var lblSDEF: UILabel!
    @IBOutlet weak var sdef: UILabel!
    @IBOutlet weak var progressSDEF: UIProgressView!
    
    //SPD
    @IBOutlet weak var lblSPD: UILabel!
    @IBOutlet weak var spd: UILabel!
    @IBOutlet weak var progressSPD: UIProgressView!
    
    //Image
    @IBOutlet weak var imageView: UIImageView!
    
    //Variavel
    var pokemon: Poke?
    var clickedPokemon: Poke?
    
    //Func que pode ser chamada varias vezes durante um ciclo de vida, e chamado quando a visualizaçao esta realmente visivel
    override func viewDidLoad() {
        configureView(pokemon: clickedPokemon!)
    }
    
    /*required init?(coder aDecoder: NSCoder) {
        
    }*/
    
    //Funçao para converter hexdecimal em String
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
    
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //Funçao que recebe os valores da API e atribui a cada elemento na tela
    func configureView(pokemon: Poke) {
        self.pokemon = pokemon
        
        //nome e id
        lblNome.text = self.pokemon?.nome.capitalized
        lblId.text = "#00" + String(self.pokemon!.id)
        
        //img
        if pokemon.linkImg != nil {
            imageView.download(from: pokemon.linkImg ?? "") }
        
        //view informaçao e view de fundo
        viewBackground.backgroundColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        viewInfo.layer.cornerRadius = 8
        
        //label tipo 1
        lblType1.text = self.pokemon?.tipos.tipos[0]
        lblType1.backgroundColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
     
        
        //altura e peso
        lblAbout.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        lblWeight.text = String(self.pokemon!.peso)
        lblHeight.text = String(self.pokemon!.altura)
        
        //habilidades
        lblMove1.text = self.pokemon?.habilidades.habilidades[0]
        //lblMove2.text = self.pokemon?.habilidades.habilidades[1]
        
        //label status
        lblBase.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        
        //label descriçao
        hp.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        atk.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        def.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        satk.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        sdef.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        spd.textColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        
        //label estatisticas
        /*lblHP.text = self.pokemon?.estatisticas.estatisticas[0]
        lblATK.text = self.pokemon?.estatisticas.estatisticas[1]
        lblDEF.text = self.pokemon?.estatisticas.estatisticas[2]
        lblSATK.text = self.pokemon?.estatisticas.estatisticas[3]
        lblSDEF.text = self.pokemon?.estatisticas.estatisticas[4]
        lblSPD.text = self.pokemon?.estatisticas.estatisticas[5]*/
        
        //progress view
        progressHP.progressTintColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        progressATK.progressTintColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        progressDEF.progressTintColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        progressSATK.progressTintColor =  hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        progressSDEF.progressTintColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        progressSPD.progressTintColor = hexStringToUIColor(hex: self.pokemon?.cor ?? "")
        
    }
    
}
