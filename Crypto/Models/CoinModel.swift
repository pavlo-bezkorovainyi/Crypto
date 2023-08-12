//
//  CoinModel.swift
//  Crypto
//
//  Created by Павел Бескоровайный on 12.08.2023.
//

import Foundation

//CoinGeko API Info
/*
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en
 
 JSON RESPONSE
 
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
 "current_price": 29415,
 "market_cap": 572273540546,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 617707802547,
 "total_volume": 5410563467,
 "high_24h": 29459,
 "low_24h": 29321,
 "price_change_24h": 86.78,
 "price_change_percentage_24h": 0.29591,
 "market_cap_change_24h": 1694278417,
 "market_cap_change_percentage_24h": 0.29694,
 "circulating_supply": 19455387,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 69045,
 "ath_change_percentage": -57.41364,
 "ath_date": "2021-11-10T14:24:11.849Z",
 "atl": 67.81,
 "atl_change_percentage": 43262.46588,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2023-08-12T18:33:38.779Z",
 "sparkline_in_7d": {
 "price": [
 29029.779904664032,
 29041.885346364976,
 29036.34608849958,
 
 ]
 },
 "price_change_percentage_24h_in_currency": 0.29590620749578117
 }
 
 
 */

import Foundation

struct CoinModel: Identifiable, Codable {
  let id, symbol, name: String
  let image: String
  let currentPrice: Double
  let marketCap, marketCapRank, fullyDilutedValuation: Double?
  let totalVolume, high24H, low24H: Double?
  let priceChange24H, priceChangePercentage24H: Double?
  let marketCapChange24H: Double?
  let marketCapChangePercentage24H: Double?
  let circulatingSupply, totalSupply, maxSupply, ath: Double?
  let athChangePercentage: Double?
  let athDate: String?
  let atl, atlChangePercentage: Double?
  let atlDate: String?
  let lastUpdated: String?
  let sparklineIn7D: SparklineIn7D?
  let priceChangePercentage24HInCurrency: Double?
  var currentHoldings: Double?
  
  enum CodingKeys: String, CodingKey {
    case id, symbol, name, image
    case currentPrice = "current_price"
    case marketCap = "market_cap"
    case marketCapRank = "market_cap_rank"
    case fullyDilutedValuation = "fully_diluted_valuation"
    case totalVolume = "total_volume"
    case high24H = "high_24h"
    case low24H = "low_24h"
    case priceChange24H = "price_change_24h"
    case priceChangePercentage24H = "price_change_percentage_24h"
    case marketCapChange24H = "market_cap_change_24h"
    case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
    case circulatingSupply = "circulating_supply"
    case totalSupply = "total_supply"
    case maxSupply = "max_supply"
    case ath
    case athChangePercentage = "ath_change_percentage"
    case athDate = "ath_date"
    case atl
    case atlChangePercentage = "atl_change_percentage"
    case atlDate = "atl_date"
    case lastUpdated = "last_updated"
    case sparklineIn7D = "sparkline_in_7d"
    case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
    case currentHoldings
  }
  
  func updateHoldings(amount: Double) -> CoinModel {
    return Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    
    //    var currentCoin = self
    //    currentCoin.currentHoldings = amount
    //    return currentCoin
    
  }
  
  var currentHoldingsValue: Double {
    return (currentHoldings ?? 0) * currentPrice
  }
  
  var rank: Int {
    return Int(marketCapRank ?? 0)
  }
}

struct SparklineIn7D: Codable {
  let price: [Double]?
}