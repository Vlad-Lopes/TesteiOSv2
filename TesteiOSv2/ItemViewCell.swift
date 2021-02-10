//
//  ItemViewCell.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 10/02/21.
//

import UIKit

class ItemViewCell: UITableViewCell {

    @IBOutlet weak var lblTipo: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblIdent: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // layoutMargins = UIEdgeInsets(top: 18, left: 18, bottom: 8, right: 8)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
