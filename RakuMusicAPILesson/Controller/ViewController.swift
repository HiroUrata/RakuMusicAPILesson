//
//  ViewController.swift
//  RakuMusicAPILesson
//
//  Created by UrataHiroki on 2021/11/07.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    private let collectionViewLayout = UICollectionViewFlowLayout()
    
    private let alamofireProcess = AlamofireProcess()
    
    private var cellContentsArray = [MusicDetailModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultCollectionView.register(UINib(nibName: "CollectionCustomCell", bundle: nil), forCellWithReuseIdentifier: "MusicDetailCell")
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        resultCollectionView.collectionViewLayout = collectionViewLayout
    }

    @IBAction func artistNameSearch(_ sender: UIButton) {
        
        if searchTextField.text?.isEmpty != true{
            
            alamofireProcess.getMusicData(searchKeyword: searchTextField.text) { result, error in
                
                if error != nil{
                    
                    print(error.debugDescription)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {[self] in
                
                    cellContentsArray = result!
                    resultCollectionView.reloadData()
                }
            }
        }
    }
    
}

extension ViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let musicDetailVC = MusicDetailViewController()
        musicDetailVC.modalPresentationStyle = .automatic
        musicDetailVC.playlistContentsArray = []
        musicDetailVC.playlistContentsArray = (cellContentsArray[indexPath.row].playList?.components(separatedBy: "###"))!
        musicDetailVC.imageURL = URL(string: cellContentsArray[indexPath.row].mediumImageUrl!)
        self.present(musicDetailVC, animated: true, completion: nil)
    }
}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicDetailCell", for: indexPath) as! CollectionCustomCell
        
        cell.mediumImageView.sd_setImage(with: URL(string: cellContentsArray[indexPath.row].mediumImageUrl!))
        cell.detailTextView.text = """
                                   タイトル:
                                      \(cellContentsArray[indexPath.row].title ?? "読み込みエラー")
                                   
                                   アーティスト:
                                      \(cellContentsArray[indexPath.row].artistName ?? "読み込みエラー")
                                   
                                   レーベル:
                                      \(cellContentsArray[indexPath.row].label ?? "読み込みエラー")
                                   
                                   説明文:
                                      \(cellContentsArray[indexPath.row].itemCaption ?? "読み込みエラー")
                                   
                                   """
        
        return cell
    
    }
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2 - 10)
    }
}

