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
    var cardCollection:[UIButton] = []
    //랜덤 숫자 저장 배열 생성
    var selectCardNumber:[Int] = []

    
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
        
        //selectCardNumber배열에 중복없는 랜덤 넘버가 5개가 생성 될떄 까지 반복
        while selectCardNumber.count < 5 {
            //랜덤 숫자를 생성하여 temp에 저장
            let temp:Int = Int(arc4random_uniform(12))
            
            //i가 0일 때
            //cardCollection에 카드를 생성 해주고
            //selectCardNumber에 랜덤 넘버를 넣어 준다.
            if i == 0 {
                cardCollection.append(UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 120)))
                selectCardNumber.append(temp)
                i += 1
            }
                
            //두번째부터 중복되지 않는 랜덤 넘버일 때 cardCollection에 카드를 생성 해주고
            //selectCardNumber에 랜덤 넘버를 넣어 준다.
            else if selectCardNumber.index(of: temp) == nil {
                cardCollection.append(UIButton(frame: CGRect(x: cardCollection[i-1].frame.maxX + 10, y: 0, width: 70, height: 120)))
                selectCardNumber.append(temp)
                i += 1
            }
        }
        
        i = 0
        
        for card in cardCollection {
            //selectCardNumber를 바탕으로 각 카드들의 이미지를 넣어주고 카드카운팅 값을 card.tag에 넣어주었다.
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
            
            //딜러도 2장의 카드를 받지만 한장만 보여주기 때문에
            //딜러일 경우 한장만 isSelected상태를 true로 설정
            //유저일 경우 두장 모두 보여주기 때문에 2장까지 isSelected상태를 true로 설정
            if i == 0 && dil {
                card.isSelected = true
            }
            else if i < 2 && !dil {
                card.isSelected = true
            }
            else {
                card.isSelected = false
            }
            
            //나머지 카드들의 isSelected상태가 false로 설정
            //카드의 이미지는 히트 전의 상태이기 떄문에 뒷면을 보여주게 설정
            //카드버튼들은 처리하는 이벤트가 없으므로 isUserInteractionEnabled false로 변경
            card.setBackgroundImage(UIImage(named: "back"), for: .normal)
            i += 1
            card.isUserInteractionEnabled = false
            self.addSubview(card)
        }
    }
}
