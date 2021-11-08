//
//  ViewController.swift
//  RakuMusicAPILesson
//
//  Created by UrataHiroki on 2021/11/07.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    private var cellContentsArray = [MusicDetailModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultCollectionView.register(UINib(nibName: "CollectionCustomCell", bundle: nil), forCellWithReuseIdentifier: "MusicDetailCell")
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
    }


}

extension ViewController:UICollectionViewDelegate{
    
    
}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    
}

