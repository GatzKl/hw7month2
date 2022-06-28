//
//  PersonCell.swift
//  hw7month2
//
//  Created by Александр Калашников on 28/6/22.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        personImageView.layer.cornerRadius = 100 / 2
        personImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
