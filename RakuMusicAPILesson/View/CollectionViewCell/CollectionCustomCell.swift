//
//  CollectionCustomCell.swift
//  RakuMusicAPILesson
//
//  Created by UrataHiroki on 2021/11/07.
//

import UIKit

class CollectionCustomCell: UICollectionViewCell {

    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        mediumImageView.image = UIImage(named: "")
        detailTextView.text = ""
    }
}
