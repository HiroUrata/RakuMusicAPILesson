//
//  MusicDetailViewController.swift
//  RakuMusicAPILesson
//
//  Created by UrataHiroki on 2021/11/08.
//

import UIKit
import SDWebImage

class MusicDetailViewController: UIViewController {

    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var playListView: UITableView!
    
    public var playlistContentsArray = [String]()
    
    public var imageURL:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediumImageView.sd_setImage(with: imageURL, completed: nil)
        playListView.register(UINib(nibName: "TableViewCustomCell", bundle: nil), forCellReuseIdentifier: "MusicNameCell")
        playListView.dataSource = self
    }
   
}

extension MusicDetailViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "PlayList"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlistContentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicNameCell", for: indexPath) as! TableViewCustomCell
        
        cell.musicNameLabel.text = playlistContentsArray[indexPath.row]
        
        return cell
    }
}
