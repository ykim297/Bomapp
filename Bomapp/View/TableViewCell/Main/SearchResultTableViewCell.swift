//
//  SearchResultTableViewCell.swift
//  Bomapp
//
//  Created by Yong Seok Kim on 2020/07/04.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit
import SnapKit

//1. 저장소 풀네임(full_name)
//2. 언어(language)
//3. last commit(updated_at 표시형식 yyyyMMdd HH:mm:ss)
//4. 스타(stargazers_count)

class SearchResultTableViewCell: UITableViewCell, Reusable {

    public static var identifier: String = "SearchResultTableViewCell"
    let line: UIView = UIView()
    let name: Label = Label(style: .title, colorStyle: .primary)
    let language: Label = Label(style: .subTitle, colorStyle: .gray)
    let update: Label = Label(style: .subTitle, colorStyle: .gray)
    let star: Label = Label(style: .title, colorStyle: .primary)
    
    
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
        self.addSubview(name)
        self.addSubview(language)
        self.addSubview(update)
        self.addSubview(star)
        self.setAutoLayOut()
    }
    
    private func setAutoLayOut() {
        
        self.line.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top)
            view.left.right.equalTo(self)
            view.height.equalTo(1.0)
        }

        self.name.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(10.0)
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)            
            view.width.equalTo(45.0)
        }
        self.language.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.name.snp.bottom).offset(5.0)
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(18.0)
        }
        self.update.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.language.snp.bottom).offset(5.0)
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(15.0)
        }
        self.star.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.update.snp.bottom).offset(5.0)
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(15.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }

    }
}



extension SearchResultTableViewCell {
    
    func setData(dic: SearchResultModel) {
        self.name.text = dic.full_name
        self.language.text = dic.language
        self.update.text = self.convertDateFormater(dic.updated_at)
        self.star.text = "Star :\(dic.stargazers_count)"
    }
        
    func convertDateFormater(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyyMMdd HH:mm:ss"
        return  dateFormatter.string(from: date!)
    }
}
