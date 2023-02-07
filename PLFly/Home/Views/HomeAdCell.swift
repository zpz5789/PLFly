//
//  HomeAdCell.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import UIKit

class HomeAdCell: UITableViewCell {

    private var imageViewArr: [UIImageView]?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.white
        self.selectionStyle = .none
        let left = UIImageView(image: R.image.homeactivePlaceHolder())

        let right = UIImageView(image: R.image.homeactivePlaceHolder())
        imageViewArr = [left, right]
        self.contentView.tb.addSubviews(imageViewArr!)
        
        let margin = 13
        left.snp.makeConstraints { make in
            make.left.equalTo(margin)
            make.top.equalTo(0)
            make.bottom.equalTo(-5).priority(500)
        }
        
        right.snp.makeConstraints { make in
            make.left.equalTo(left.snp.right).offset(9)
            make.right.equalTo(-margin);
            make.top.equalTo(0);
            make.bottom.equalTo(left);
            make.width.equalTo(left);
            make.width.equalTo(right.snp.height).multipliedBy(490/230);
        }
        
        left.tb.addTapGestureRecognizerAction(self, #selector(tapClick(_:)))
        right.tb.addTapGestureRecognizerAction(self, #selector(tapClick(_:)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   @objc private func tapClick(_ tap: UITapGestureRecognizer?) {
        print("image did click")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
