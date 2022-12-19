//
// ArticleAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class ArticleAPI {
    
    /**
     
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func articlesCountGet(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: articlesCountGet200Response?, _ error: Error?) -> Void)) -> RequestTask {
        return articlesCountGetWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    /**
     
     - GET /articles/count
     -
     - BASIC:
     - type: http
     - name: bearerAuth
     - returns: RequestBuilder<V3ArticlesCountGet200Response>
     */
    open class func articlesCountGetWithRequestBuilder() -> RequestBuilder<articlesCountGet200Response> {
        let localVariablePath = "/articles/count"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil
        
        let localVariableUrlComponents = URLComponents(string: localVariableURLString)
        
        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]
        
        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)
        
        let localVariableRequestBuilder: RequestBuilder<articlesCountGet200Response>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        
        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
    
    /**
     
     
     - parameter limit: (query) Maximum number of results possible (optional)
     - parameter sort: (query) Sort according to a specific field. (optional)
     - parameter start: (query) Skip a specific number of entries (especially useful for pagination) (optional)
     - parameter ne: (query) Get records that are not equals to something (optional)
     - parameter lt: (query) Get record that are lower than a value (optional)
     - parameter lte: (query) Get records that are lower than or equal to a value (optional)
     - parameter gt: (query) Get records that are greater than a value (optional)
     - parameter gte: (query) Get records that are greater than  or equal a value (optional)
     - parameter contains: (query) Get records that contains a value (optional)
     - parameter containss: (query) Get records that contains (case sensitive) a value (optional)
     - parameter _in: (query) Get records that matches any value in the array of values (optional)
     - parameter nin: (query) Get records that doesn&#39;t match any value in the array of values (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func articlesGet(limit: Int? = nil, newsSite: NewsSite? = nil, sort: String? = nil, start: Int? = nil, ne: String? = nil, lt: String? = nil, lte: String? = nil, gt: String? = nil, gte: String? = nil, contains: String? = nil, containss: String? = nil, _in: [String]? = nil, nin: [String]? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Article]?, _ error: Error?) -> Void)) -> RequestTask {
        return articlesGetWithRequestBuilder(limit: limit, sort: sort, newsSite: newsSite, start: start, ne: ne, lt: lt, lte: lte, gt: gt, gte: gte, contains: contains, containss: containss, _in: _in, nin: nin).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    /**
     
     - GET /articles
     -
     - BASIC:
     - type: http
     - name: bearerAuth
     - parameter limit: (query) Maximum number of results possible (optional)
     - parameter sort: (query) Sort according to a specific field. (optional)
     - parameter start: (query) Skip a specific number of entries (especially useful for pagination) (optional)
     - parameter q: (query) Get entries that matches exactly your input (optional)
     - parameter ne: (query) Get records that are not equals to something (optional)
     - parameter lt: (query) Get record that are lower than a value (optional)
     - parameter lte: (query) Get records that are lower than or equal to a value (optional)
     - parameter gt: (query) Get records that are greater than a value (optional)
     - parameter gte: (query) Get records that are greater than  or equal a value (optional)
     - parameter contains: (query) Get records that contains a value (optional)
     - parameter containss: (query) Get records that contains (case sensitive) a value (optional)
     - parameter _in: (query) Get records that matches any value in the array of values (optional)
     - parameter nin: (query) Get records that doesn&#39;t match any value in the array of values (optional)
     - returns: RequestBuilder<[Article]>
     */
    open class func articlesGetWithRequestBuilder(limit: Int? = nil, sort: String? = nil, newsSite: NewsSite? = nil, start: Int? = nil, ne: String? = nil, lt: String? = nil, lte: String? = nil, gt: String? = nil, gte: String? = nil, contains: String? = nil, containss: String? = nil, _in: [String]? = nil, nin: [String]? = nil) -> RequestBuilder<[Article]> {
        let localVariablePath = "/articles"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil
        
        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "_limit": (wrappedValue: limit?.encodeToJSON(), isExplode: true),
            "_sort": (wrappedValue: sort?.encodeToJSON(), isExplode: true),
            "_start": (wrappedValue: start?.encodeToJSON(), isExplode: true),
            "_ne": (wrappedValue: ne?.encodeToJSON(), isExplode: true),
            "_lt": (wrappedValue: lt?.encodeToJSON(), isExplode: true),
            "_lte": (wrappedValue: lte?.encodeToJSON(), isExplode: true),
            "_gt": (wrappedValue: gt?.encodeToJSON(), isExplode: true),
            "_gte": (wrappedValue: gte?.encodeToJSON(), isExplode: true),
            "_contains": (wrappedValue: contains?.encodeToJSON(), isExplode: true),
            "_containss": (wrappedValue: containss?.encodeToJSON(), isExplode: true),
            "_in": (wrappedValue: _in?.encodeToJSON(), isExplode: true),
            "_nin": (wrappedValue: nin?.encodeToJSON(), isExplode: true),
            "newsSite": (wrappedValue: newsSite?.rawValue.encodeToJSON(), isExplode: true),
        ])
        
        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]
        
        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)
        
        let localVariableRequestBuilder: RequestBuilder<[Article]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        
        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
    
    /**
     
     
     - parameter id: (path)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func articlesIdGet(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: Article?, _ error: Error?) -> Void)) -> RequestTask {
        return articlesIdGetWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    /**
     
     - GET /articles/{id}
     -
     - BASIC:
     - type: http
     - name: bearerAuth
     - parameter id: (path)
     - returns: RequestBuilder<Article>
     */
    open class func articlesIdGetWithRequestBuilder(id: String) -> RequestBuilder<Article> {
        var localVariablePath = "/articles/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil
        
        let localVariableUrlComponents = URLComponents(string: localVariableURLString)
        
        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]
        
        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)
        
        let localVariableRequestBuilder: RequestBuilder<Article>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        
        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}