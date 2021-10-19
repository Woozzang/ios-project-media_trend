//
//  TvShow.swift
//  MediaTrend
//
//  Created by Woochan Park on 2021/10/19.
//

import Foundation

// FIXME: 이 모델을 그대로 쓰는 것은 위험하다.
// FIXME: API가 확정되면 DTO 와 실제 Model 을 분리하자

struct TvShow {
  
  var title: String
  var releaseDate: String
  var genre: String
  var region: String
  var overview: String
  var rate: Float
  var starring: String
  var backdropImage: String
}

//TvShow(title: "Squid Game", releaseDate: "09/17/2021",genre: "Mystery",region: "South Korea", overview: "Hundreds of cash-strapped players accept a strange invitation to compete in children's games. Inside, a tempting prize awaits — with deadly high stakes.", rate: 8.3, starring: "Lee Jung-jae, Park Hae-soo, Wi Ha-jun, Heo Sung-tae, Kim Joo-ryoung, Jung Ho-yeon, Lee You-mi",backdropImage:"https://www.themoviedb.org/t/p/original/oaGvjB0DvdhXhOAuADfHb261ZHa.jpg")
