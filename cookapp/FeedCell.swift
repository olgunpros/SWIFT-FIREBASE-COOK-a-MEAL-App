//
//  FeedCell.swift
//  cookapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 23.12.2023.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var adLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var tarifLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

  
    
    
}
