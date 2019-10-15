//
//  Model.swift
//  DataModel
//
//  Created by 박상욱 on 2018. 3. 30..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

//MARK: 유저정보 및 결제관련 카드 데이터
struct User {
    let firstName: String // 이름
    let lastName: String // 성
    let phoneNumber: String // 휴대폰 번호
    let email: String // 이메일(아이디)
    let profileImage: String? // 프로필 사진
    let creditCards: [CreditCard] // 결제 카드의 목록
    let favorites: [Favorites] // 즐겨 찾는 매장의 목록
    let location: [Location]
    let document: [ToS]
}

struct ToS {
    let first: Bool
    let second: Bool
    let third: Bool
}

struct Location {
    let latitude: Float
    let longitude: Float
    let Name: String
}

struct CreditCard {
    let creditCard: String? // 결제할 카드
}

struct Favorites {
    let favoriteRestaurant: [String?] //즐겨 찾는 매장의 고유번호를 저장
}

//MARK: 음식점 및 메뉴 데이터
struct restaurants {
    let restaurants: [restaurant] // 매장 목록
}

struct restaurant {
    let restaurantID: String // 매장 고유 번호
    let isOpen: Bool // 매장 오픈 여부
    let address: String // 매장 주소
    let description: String // 매장 설명
    let restaurantImage: String // 매장 표시 이미지
    let minimumCookingTime: Date // 매장 최소 조리시간
    let maximumCookingTime: Date // 매장 최대 조리시간
    let menu: [Menu] // 메뉴 목록
    let category: [Category] // 식당의 유형 예)카페, 한식
}

struct Menu {
    let price: Int // 음식 가격
    let foodName: String // 음식 이름
    let foodImage: String? // 음식 사진
    let foodDescription: String // 음식 설명
}

struct Category {
    let categoryName: String // 카테고리명
    let categoryImage: String // 카테고리 이미지
}
