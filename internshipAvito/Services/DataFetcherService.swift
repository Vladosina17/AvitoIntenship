//
//  DataFetcherService.swift
//  internshipAvito
//
//  Created by Влад Барченков on 26.01.2021.
//

import Foundation

class DataFetcherService {
    
    var localDataFetcher: DataFetcher
    
    init(localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchLocalResult(completion: @escaping (Model?) -> Void) {
        let localUrlString = "result.json"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
    
}
