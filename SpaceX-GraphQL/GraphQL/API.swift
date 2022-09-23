// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UpcomingLaunchesQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UpcomingLaunchesQuery {
      launchesUpcoming(limit: 10) {
        __typename
        details
        id
        launch_success
        launch_site {
          __typename
          site_id
          site_name
        }
      }
    }
    """

  public let operationName: String = "UpcomingLaunchesQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launchesUpcoming", arguments: ["limit": 10], type: .list(.object(LaunchesUpcoming.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launchesUpcoming: [LaunchesUpcoming?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launchesUpcoming": launchesUpcoming.flatMap { (value: [LaunchesUpcoming?]) -> [ResultMap?] in value.map { (value: LaunchesUpcoming?) -> ResultMap? in value.flatMap { (value: LaunchesUpcoming) -> ResultMap in value.resultMap } } }])
    }

    public var launchesUpcoming: [LaunchesUpcoming?]? {
      get {
        return (resultMap["launchesUpcoming"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LaunchesUpcoming?] in value.map { (value: ResultMap?) -> LaunchesUpcoming? in value.flatMap { (value: ResultMap) -> LaunchesUpcoming in LaunchesUpcoming(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LaunchesUpcoming?]) -> [ResultMap?] in value.map { (value: LaunchesUpcoming?) -> ResultMap? in value.flatMap { (value: LaunchesUpcoming) -> ResultMap in value.resultMap } } }, forKey: "launchesUpcoming")
      }
    }

    public struct LaunchesUpcoming: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("details", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("launch_success", type: .scalar(Bool.self)),
          GraphQLField("launch_site", type: .object(LaunchSite.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(details: String? = nil, id: GraphQLID? = nil, launchSuccess: Bool? = nil, launchSite: LaunchSite? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "details": details, "id": id, "launch_success": launchSuccess, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var launchSuccess: Bool? {
        get {
          return resultMap["launch_success"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_success")
        }
      }

      public var launchSite: LaunchSite? {
        get {
          return (resultMap["launch_site"] as? ResultMap).flatMap { LaunchSite(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "launch_site")
        }
      }

      public struct LaunchSite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchSite"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("site_id", type: .scalar(String.self)),
            GraphQLField("site_name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(siteId: String? = nil, siteName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchSite", "site_id": siteId, "site_name": siteName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var siteId: String? {
          get {
            return resultMap["site_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_id")
          }
        }

        public var siteName: String? {
          get {
            return resultMap["site_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name")
          }
        }
      }
    }
  }
}
