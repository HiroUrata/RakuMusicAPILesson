//
//  AlamofireProcess.swift
//  RakuMusicAPILesson
//
//  Created by UrataHiroki on 2021/11/08.
//

import Alamofire
import SwiftyJSON

class AlamofireProcess{
    
    private var privateMediumImageUrl:String?
    private var privateTitle:String?
    private var privateArtistName:String?
    private var privateLabel:String?
    private var privateItemCaption:String?
    private var privatePlayList:String?
    
    
    private var getMusicDataArray = [MusicDetailModel]()
}

extension AlamofireProcess{
    
    public func getMusicData(searchKeyword:String?,completion: @escaping ([MusicDetailModel]?,Error?) -> Void){
        
        guard let keyword = searchKeyword else { return }
        
        let apikKey = "apiKey"
        
        AF.request(apikKey, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {[self] response in
            
            switch response.result{
                
            case .success:
                
                let detailData = JSON(response.data as Any)
                
                for dataCount in 0..<detailData["Items"].count{
                    
                    getDataNilCheck(checkMediumImageUrl: detailData["Items"][dataCount]["Item"]["mediumImageUrl"].string,
                                    checkTitle: detailData["Items"][dataCount]["Item"]["title"].string,
                                    checkArtistName: detailData["Items"][dataCount]["Item"]["artistName"].string,
                                    checkLabel: detailData["Items"][dataCount]["Item"]["label"].string,
                                    checkItemCaption: detailData["Items"][dataCount]["Item"]["itemCaption"].string,
                                    checkPlayList: detailData["Items"][dataCount]["Item"]["playList"].string)
                    
                    getMusicDataArray.append(MusicDetailModel(mediumImageUrl: privateMediumImageUrl,
                                                              title: privateTitle,
                                                              artistName: privateArtistName,
                                                              label: privateLabel,
                                                              itemCaption: privateItemCaption,
                                                              playList: privatePlayList))
                }
                completion(getMusicDataArray, nil)
                
            case .failure(let error):
            
                completion(nil, error)
            }
        }
    }
}


extension AlamofireProcess{
    
    private func getDataNilCheck(checkMediumImageUrl:String?,checkTitle:String?,checkArtistName:String?,checkLabel:String?,checkItemCaption:String?,checkPlayList:String?){
        
        if checkMediumImageUrl != nil{
            
            privateMediumImageUrl = checkMediumImageUrl
        }else{
            
            privateMediumImageUrl = "noSign"
        }
        
        
        if checkTitle != nil{
            
            privateTitle = checkTitle
        }else{
            
            privateTitle = "読み込みエラー"
        }
        
        if checkArtistName != nil{
            
            privateArtistName = checkArtistName
        }else{
            
            privateArtistName = "読み込みエラー"
        }
        
        if checkLabel != nil{
            
            privateLabel = checkLabel
        }else{
            
            privateLabel = "読み込みエラー"
        }
        
        if checkItemCaption != nil{
            
            privateItemCaption = checkItemCaption
        }else{
            
            privateItemCaption = "読み込みエラー"
        }
        
        if checkPlayList != nil{
            
            privatePlayList = checkPlayList
        }else{
            
            privatePlayList = "読み込みエラー"
        }
        
    }
}



extension String{
    
    var urlEncoded:String{
        
        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        let remove = removingPercentEncoding ?? self
        
        return remove.addingPercentEncoding(withAllowedCharacters: charset) ?? remove
    }
}
