//
//  test.swift
//  CollectionViewSample
//
//  Created by 박소정 on 2018. 3. 8..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation
import UIKit


class testViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension <#ViewController#>: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //만들어지는 컬렉션 뷰의 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int
        ) -> Int {
        
        return 10
    }
    
    //셀의 설정을 리턴해주는 셀 설정 함수
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
        
    }
    
}
