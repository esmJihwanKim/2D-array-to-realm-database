//
//  DetailsTableViewCell.swift
//  RealmForContacts
//
//  Created by Jihwan Kim on 2020/03/03.
//  Copyright © 2020 LogicLead. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    //contains titleLabel and desriptionLabel
    let responder = UIResponder()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        //enables autolayout for view
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        //enables autolayout for view
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        return label
    }()
    
    
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)

        setupLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}


extension DetailsTableViewCell {
    
    private func setupLayout() {
        
        //title
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        //description
        descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        descriptionLabel.numberOfLines = 2

    }
    
}
