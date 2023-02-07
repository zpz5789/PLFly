//
//  PositionCell.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import UIKit

class PositionCell: UITableViewCell {
    private lazy var companyNameLabel = {
        return UILabel().font(14).color(UIColor(hexInt: 0x141418))
    }()
    
    private lazy var companyScaleLabel = {
        return UILabel().font(11).color(UIColor(hexInt: 0x5f5f6b))
    }()
    
    private lazy var companyLogoImageView = {
        return UIImageView()
    }()
    private lazy var positionNameLabel = {
        return UILabel().font(14).color(UIColor(hexInt: 0x141418))
    }()
    
    private lazy var positionTypeLabel = {
        let label = UILabel().font(14).color(UIColor(hexInt: 0xfa7d00)).textAlignment(.center)
        label.tb.addCorner(conrners: .allCorners, radius: 3)
        return label
    }()
    
    private lazy var positionRequestLabel = {
        return UILabel().font(14).color(UIColor(hexInt: 0x5f5f6b))
    }()
    
    private lazy var positionSalaryLabel = {
        return UILabel().font(16).color(UIColor(hexInt: 0xff5757)).textAlignment(.right)
    }()
    
    private lazy var positionPostDateLabel = {
        return UILabel().font(12).color(UIColor(hexInt: 0x97979f)).textAlignment(.right)
    }()
    
    private lazy var vipImageView = {
        let imageView = UIImageView(image: R.image.viP())
        imageView.isHidden(true)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(positionNameLabel)
        self.contentView.addSubview(positionTypeLabel)
        self.contentView.addSubview(positionPostDateLabel)
        self.contentView.addSubview(positionRequestLabel)
        self.contentView.addSubview(positionSalaryLabel)
        self.contentView.addSubview(companyLogoImageView)
        self.contentView.addSubview(companyNameLabel)
        self.contentView.addSubview(companyScaleLabel)
        self.contentView.addSubview(vipImageView)
        
        let margin = 13.0
        self.positionNameLabel.snp.makeConstraints { make in
            make.left.equalTo(margin)
            make.top.equalTo(15)
        }
        
        self.positionTypeLabel.snp.makeConstraints { make in
            make.left.equalTo(self.positionNameLabel.snp.right).offset(3)
            make.centerY.equalTo(self.positionNameLabel)
            make.width.equalTo(30)
        }
        
        self.positionSalaryLabel.snp.makeConstraints({ make in
            make.right.equalTo(-margin)
            make.top.equalTo(18)
            make.left.greaterThanOrEqualTo(self.positionTypeLabel.snp.right).offset(10)
        })
        
        self.positionRequestLabel.snp.makeConstraints { make in
            make.left.equalTo(margin)
            make.top.equalTo(self.positionNameLabel.snp.bottom).offset(10)
        }
        
        self.positionPostDateLabel.snp.makeConstraints { make in
            make.right.equalTo(-margin)
            make.top.equalTo(self.positionSalaryLabel.snp.bottom).offset(12)
        }
        
        // 水平方向上抗压缩能力
        self.positionNameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        self.companyLogoImageView.snp.makeConstraints { make in
            make.left.equalTo(margin)
            make.top.equalTo(self.positionRequestLabel.snp.bottom).offset(20)
            make.width.height.equalTo(30)
            make.bottom.equalTo(-20)
        }
        
        self.companyNameLabel.snp.makeConstraints { make in
            make.left.equalTo(self.companyLogoImageView.snp.right).offset(10)
            make.top.equalTo(self.companyLogoImageView.snp.bottom).offset(-3)
        }
        
        self.companyScaleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.companyNameLabel)
            make.top.equalTo(self.companyNameLabel.snp.bottom).offset(3)
        }
        
        self.vipImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self.companyLogoImageView.snp.right)
            make.centerY.equalTo(self.companyLogoImageView.snp.bottom)
        }
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
