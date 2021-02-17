//
//  ListViewCell.swift
//  KVKCalendar
//
//  Created by Sergei Kviatkovskii on 27.12.2020.
//

import UIKit

final class ListViewCell: UITableViewCell {
    
    private let txtLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 0
        return label
    }()
    
    private let dotView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    var txt: String? {
        didSet {
            txtLabel.text = txt
        }
    }
    
    var dotColor: UIColor? {
        didSet {
            dotView.backgroundColor = dotColor
        }
    }
    
    var cellStyle: ListViewStyle? {
        didSet{
            spaceView.backgroundColor = cellStyle?.cellSpaceColor
            txtLabel.font = cellStyle?.fontBullet
        }
    }
    
    var textLabelColor: UIColor? {
        didSet{
            txtLabel.textColor = textLabelColor
        }
    }
    
    private var spaceView: UIView = {
        let spaceView = UIView()
        spaceView.backgroundColor = .white
        return spaceView
    }()
    
    private var containerView: UIView = {
        let container = UIView()
        return container
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(spaceView)
        contentView.addSubview(containerView)
        containerView.addSubview(txtLabel)
        containerView.addSubview(dotView)
        dotView.translatesAutoresizingMaskIntoConstraints = false
        txtLabel.translatesAutoresizingMaskIntoConstraints = false
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let spaceViewLeading = spaceView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        let spaceViewTrailing = spaceView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0)
        let spaceViewBottom = spaceView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        let spaceViewHeight = spaceView.heightAnchor.constraint(equalToConstant: 12)
        NSLayoutConstraint.activate([spaceViewBottom, spaceViewLeading, spaceViewTrailing, spaceViewHeight])
        
        let containerTopAnchor = containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        let continerBottomAnchor = containerView.bottomAnchor.constraint(equalTo: spaceView.topAnchor, constant: 0)
        let containerLeftAnchor = containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        let containerRightAnchor = containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0)
        NSLayoutConstraint.activate([containerTopAnchor, continerBottomAnchor, containerLeftAnchor, containerRightAnchor])
        
        let leftDot: NSLayoutConstraint
        if #available(iOS 11.0, *) {
            leftDot = dotView.leftAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leftAnchor)
        } else {
            leftDot = dotView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15)
        }
        let centerYDot = dotView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        let widthDot = dotView.widthAnchor.constraint(equalToConstant: 20)
        let heightDot = dotView.heightAnchor.constraint(equalToConstant: 20)
        NSLayoutConstraint.activate([leftDot, centerYDot, widthDot, heightDot])
        
        let topTxt = txtLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15)
        let bottomTxt = txtLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15)
        let leftTxt = txtLabel.leftAnchor.constraint(equalTo: dotView.rightAnchor, constant: 10)
        let rightTxt = txtLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15)
        NSLayoutConstraint.activate([topTxt, bottomTxt, leftTxt, rightTxt])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
