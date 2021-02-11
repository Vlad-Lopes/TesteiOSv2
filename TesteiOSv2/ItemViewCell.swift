//
//  ItemViewCell.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 10/02/21.
//

import UIKit

class ItemViewCell: UITableViewCell {

    @IBOutlet weak var vwCell: UIView!
    @IBOutlet weak var lblTipo: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblIdent: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
 
        //layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        vwCell.layer.shadowColor = CGColor(colorSpace: .blue)
//       vwCell.layer.shadowOpacity = 0.3
//        vwCell.layer.shadowOffset = .zero
//        vwCell.layer.shadowRadius = 10
        
        backgroundColor = UIColor(ciColor: .clear)  // Colors.colorClear

 //           self.vwCell.layer.borderWidth = 1
 //           vwCell.layer.cornerRadius = 3
//        self.vwCell.layer.borderColor = UIColor(ciColor: .clear).cgColor // Colors.colorClear.cgColor
//            self.vwCell.layer.masksToBounds = true

            self.layer.shadowOpacity = 0.18
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowRadius = 2
         //   self.layer.shadowColor = Colors.colorBlack.cgColor
        self.layer.shadowColor = UIColor(ciColor: .black).cgColor
            self.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
