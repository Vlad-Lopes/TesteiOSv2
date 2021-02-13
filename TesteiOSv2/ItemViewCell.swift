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
        
        let myColor = UIColor(red: 0.3, green: 0.75, blue: 0.95, alpha: 1)
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = myColor.cgColor   //UIColor.blue.cgColor
        clipsToBounds = false
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // add shadow on cell
//        backgroundColor = .clear // very important
//        layer.masksToBounds = false
//        layer.shadowOpacity = 0.5
//        layer.shadowRadius = 4
//        layer.shadowOffset = CGSize(width: 0, height: 0)
//        layer.shadowColor = UIColor.black.cgColor
//        clipsToBounds = false
//
//        // add corner radius on `contentView`
//        contentView.backgroundColor = .white
//        contentView.layer.cornerRadius = 8
   //     contentView.layer.masksToBounds = false
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
}
