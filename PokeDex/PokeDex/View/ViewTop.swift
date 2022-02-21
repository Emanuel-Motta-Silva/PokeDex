//
//  ViewTop.swift
//  PokeDex
//
//  Created by user212276 on 1/11/22.
//

import UIKit
import TinyConstraints

class ViewTop: UIView {
    
    //@IBOutlet weak var lblPokeDex : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        //lblPokeDex.font = UIFont(name: "Poppins Bold 24", size: 24)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
