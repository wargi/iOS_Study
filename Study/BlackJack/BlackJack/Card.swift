//
//  Card.swift
//  BlackJack
//
//  Created by 박상욱 on 2018. 2. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class Card: UIView {

    //버튼생성
    var firstCard:UIButton!
    var secondtCard:UIButton!
    var thirdCard:UIButton!
    var fourthCard:UIButton!
    var lastCard:UIButton!
    var cardName:UIButton!
    var selectCardNumber:[Int] = []
    var cardCollection:[UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, diller : Bool) {
        self.init(frame: frame)
        create(dil : diller)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create(dil : Bool) {
        var i = 0
        
        while selectCardNumber.count < 5 {
            let temp:Int = Int(arc4random_uniform(12))
            
            if i == 0 {
                cardCollection.append(UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 120)))
                selectCardNumber.append(temp)
                i += 1
            }
            else if selectCardNumber.index(of: temp) == nil {
                cardCollection.append(UIButton(frame: CGRect(x: cardCollection[i-1].frame.maxX + 10, y: 0, width: 70, height: 120)))
                selectCardNumber.append(temp)
                i += 1
            }
        }
        
        i = 0
        
        for card in cardCollection {
            switch selectCardNumber[i] {
            case 0:
                card.setBackgroundImage(UIImage(named: "ace_of_spades"), for: .selected)
                card.tag = 1
            case 1:
                card.setBackgroundImage(UIImage(named: "2_of_spades"), for: .selected)
                card.tag = 2
            case 2:
                card.setBackgroundImage(UIImage(named: "3_of_spades"), for: .selected)
                card.tag = 3
            case 3:
                card.setBackgroundImage(UIImage(named: "4_of_spades"), for: .selected)
                card.tag = 4
            case 4:
                card.setBackgroundImage(UIImage(named: "5_of_spades"), for: .selected)
                card.tag = 5
            case 5:
                card.setBackgroundImage(UIImage(named: "6_of_spades"), for: .selected)
                card.tag = 6
            case 6:
                card.setBackgroundImage(UIImage(named: "7_of_spades"), for: .selected)
                card.tag = 7
            case 7:
                card.setBackgroundImage(UIImage(named: "8_of_spades"), for: .selected)
                card.tag = 8
            case 8:
                card.setBackgroundImage(UIImage(named: "9_of_spades"), for: .selected)
                card.tag = 9
            case 9:
                card.setBackgroundImage(UIImage(named: "10_of_spades"), for: .selected)
                card.tag = 10
            case 10:
                card.setBackgroundImage(UIImage(named: "jack_of_spades2"), for: .selected)
                card.tag = 10
            case 11:
                card.setBackgroundImage(UIImage(named: "queen_of_spades2"), for: .selected)
                card.tag = 10
            case 12:
                card.setBackgroundImage(UIImage(named: "king_of_spades2"), for: .selected)
                card.tag = 10
            default:
                card.setBackgroundImage(UIImage(named: "back"), for: .normal)
            }
            
            if i == 0 && dil {
                card.isSelected = true
            }
            else if i < 2 && !dil {
                card.isSelected = true
            }
            else {
                card.isSelected = false
            }
            
            card.setBackgroundImage(UIImage(named: "back"), for: .normal)
            i += 1
            card.isUserInteractionEnabled = false
            self.addSubview(card)
        }
    }
}
