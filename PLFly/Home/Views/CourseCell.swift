//
//  CourseCell.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import UIKit

class CourseCell: UITableViewCell {

    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.placeHolder_courseList())
        imageView.tb.addCorner(conrners: .allCorners, radius: 3)
        return imageView
    }()
    
    private lazy var courseNameLabel: UILabel = {
        let label = UILabel().color(UIColor(hexInt: 0x141418)).textAlignment(.left).font(UIFont.tb.textF(14)).text("成为企业人")
        return label
    }()
    
    private lazy var courseGradeLabel: UILabel = {
        let label = UILabel().color(UIColor(hexInt: 0x5f5f6b)).textAlignment(.left).font(UIFont.tb.textF(12)).text("初级·10课时")
        return label
    }()
    
    private lazy var watchPersonNumbersButton: UIButton = {
        let btn = UIButton().textColor(UIColor(hexInt: 0x5f5f6b)).textColor(UIColor(hexInt: 0x5f5f6b), .highlighted)
        btn.font(UIFont.tb.textF(12)).image(R.image.course_watch_personscount()).title("1000")
        return btn
    }()
    
    private lazy var coursePriceLabel: UILabel = {
        let label = UILabel().color(UIColor(hexInt: 0x141418)).textAlignment(.left).font(UIFont.tb.textF(14)).text("￥500")
        return label
    }()
    
    private lazy var studyProgressLabel: UILabel = {
        let label = UILabel().color(UIColor(hexInt: 0x5f5f6b)).textAlignment(.right).font(UIFont.tb.textF(12)).text("")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(courseImageView)
        self.contentView.addSubview(courseNameLabel)
        self.contentView.addSubview(courseGradeLabel)
        self.contentView.addSubview(watchPersonNumbersButton)
        self.contentView.addSubview(coursePriceLabel)
        self.contentView.addSubview(studyProgressLabel)
        
        let margin = 13.0
        //w:h 250 : 140
        self.courseImageView.snp.makeConstraints({ make in
            make.left.top.equalTo(margin);
            make.size.equalTo(CGSizeMake(125, 70))
            make.bottom.equalTo(-margin).priority(500)
        })
        
        self.courseNameLabel.snp.makeConstraints { make in
            make.left.equalTo(courseImageView.snp.right).offset(margin)
            make.top.equalTo(courseImageView.snp.top).offset(-1.5)
            make.right.lessThanOrEqualTo(-margin)
        }
        
        self.courseNameLabel.setContentHuggingPriority(.required, for: .vertical)
        
        self.coursePriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(courseImageView.snp.bottom).offset(3).priority(900)
            make.left.equalTo(courseImageView.snp.right).offset(margin)
        }
        
        self.courseGradeLabel.snp.makeConstraints { make in
            make.left.equalTo(coursePriceLabel);
            make.top.equalTo(courseNameLabel.snp.bottom).offset(-5);
            make.bottom.equalTo(coursePriceLabel.snp.top).offset(5);
        }
        
        self.watchPersonNumbersButton.snp.makeConstraints { make in
            make.right.equalTo(-margin);
            make.centerY.equalTo(courseGradeLabel);
        }
        
        self.studyProgressLabel.snp.makeConstraints { make in
            make.right.equalTo(-margin)
            make.centerY.equalTo(coursePriceLabel)
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
