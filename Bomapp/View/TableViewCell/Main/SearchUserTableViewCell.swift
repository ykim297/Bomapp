//
//  SearchUserTableViewCell.swift
//  Bomapp
//
//  Created by Yong Seok Kim on 2020/07/05.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//


import UIKit
import Cosmos
import SnapKit

//1. 썸네일(avatar_url)
//2. Repository 수(public_repos)
//3. 지역(location)
//4. 이름(name)

class SearchUserTableViewCell: UITableViewCell, Reusable {

    public static var identifier: String = "SearchUserTableViewCell"
    let line: UIView = UIView()
    let avatar: UIImageView = UIImageView()
    let name: Label = Label(style: .title, colorStyle: .gray)
    let repositoryCount: Label = Label(style: .subTitle, colorStyle: .primary)
    let location: Label = Label(style: .subTitle, colorStyle: .gray)
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        self.setComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setComponent() {
        line.backgroundColor = .gray
        self.addSubview(line)
        self.addSubview(avatar)
        self.addSubview(name)
        self.addSubview(repositoryCount)
        self.addSubview(location)
        avatar.roundCorners(.allCorners, radius: 25)
        
        self.setAutoLayOut()
    }
    
    private func setAutoLayOut() {
        
        self.line.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top)
            view.left.right.equalTo(self)
            view.height.equalTo(1.0)
        }

        self.avatar.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.height.equalTo(50.0)
            view.width.equalTo(50.0)
        }
        self.name.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(10.0)
            view.left.equalTo(self.avatar.snp.right).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(18.0)
        }
        self.repositoryCount.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.name.snp.bottom).offset(3.0)
            view.left.equalTo(self.snp.left).offset(70.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(15.0)
        }
        self.location.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.repositoryCount.snp.bottom).offset(3.0)
            view.left.equalTo(self.snp.left).offset(70.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(15.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
    }
}



extension SearchUserTableViewCell {    
    func setData(dic: OwnerModel) {
        self.getUser(id: dic.login) { success, model in
            if let m = model {
                DispatchQueue.main.async {
                    self.avatar.downloadImageFrom(urlString: m.avatar_url, imageMode: .scaleAspectFill)
                    self.name.text = m.name
                    self.repositoryCount.text = "Repository Count: \(m.public_repos ?? 0)"
                    self.location.text = m.location
                }
            }
        }
    }
    
    func getUser(id: String,
                 completion: @escaping (Bool, OwnerModel?) -> Void) {
        
        NetworkManager.shared.getUser(id: id, completion: { model, error in
            if let _ = error {
                completion(false, nil)
            } else {
                if let m = model {
                    completion(true, m)
                }
            }
        })
    }
    
}

