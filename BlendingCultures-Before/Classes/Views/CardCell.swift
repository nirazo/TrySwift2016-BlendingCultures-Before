//
//  CardCell.swift
//  BlendingCultures-Before
//
//  Created by Kenzo on 2016/03/05.
//  Copyright © 2016年 Karuta. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    var suitLabel: UILabel
    var rankLabel: UILabel

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        suitLabel = UILabel(frame: CGRectZero)
        rankLabel = UILabel(frame: CGRectZero)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(suitLabel)
        self.contentView.addSubview(rankLabel)
        self.updateLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillWith(card: Card) {
        rankLabel.textColor = card.color
        rankLabel.text = card.rank.description
        suitLabel.textColor = card.color
        self.updateLayout()
    }

    private func updateLayout() {
        suitLabel.frame = CGRect(x: 100, y: 0, width: 30, height: self.frame.height)
        rankLabel.frame = CGRect(x: 150, y: 0, width: 30, height: self.frame.height)
    }
}
