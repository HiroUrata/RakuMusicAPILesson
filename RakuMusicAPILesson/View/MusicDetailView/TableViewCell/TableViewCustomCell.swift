//
//  TableViewCustomCell.swift
//  RakuMusicAPILesson
//
//  Created by UrataHiroki on 2021/11/08.
//

import UIKit

class TableViewCustomCell: UITableViewCell {

    
    @IBOutlet weak var musicNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        musicNameLabel.text = ""
    }
    
}
