// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PastLaunchesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PastLaunches($limit: Int!, $offset: Int!) {
      launchesPast(limit: $limit, offset: $offset) {
        __typename
        id
        details
        mission_name
        launch_date_local
        launch_site {
          __typename
          site_name_long
          site_id
        }
        rocket {
          __typename
          rocket_name
        }
      }
    }
    """

  public let operationName: String = "PastLaunches"

  public var limit: Int
  public var offset: Int

  public init(limit: Int, offset: Int) {
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launchesPast", arguments: ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .list(.object(LaunchesPast.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launchesPast: [LaunchesPast?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launchesPast": launchesPast.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }])
    }

    public var launchesPast: [LaunchesPast?]? {
      get {
        return (resultMap["launchesPast"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LaunchesPast?] in value.map { (value: ResultMap?) -> LaunchesPast? in value.flatMap { (value: ResultMap) -> LaunchesPast in LaunchesPast(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }, forKey: "launchesPast")
      }
    }

    public struct LaunchesPast: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("details", type: .scalar(String.self)),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("launch_date_local", type: .scalar(String.self)),
          GraphQLField("launch_site", type: .object(LaunchSite.selections)),
          GraphQLField("rocket", type: .object(Rocket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, details: String? = nil, missionName: String? = nil, launchDateLocal: String? = nil, launchSite: LaunchSite? = nil, rocket: Rocket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "details": details, "mission_name": missionName, "launch_date_local": launchDateLocal, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var missionName: String? {
        get {
          return resultMap["mission_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_name")
        }
      }

      public var launchDateLocal: String? {
        get {
          return resultMap["launch_date_local"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_date_local")
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

      public var rocket: Rocket? {
        get {
          return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
        }
      }

      public struct LaunchSite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchSite"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("site_name_long", type: .scalar(String.self)),
            GraphQLField("site_id", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(siteNameLong: String? = nil, siteId: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchSite", "site_name_long": siteNameLong, "site_id": siteId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var siteNameLong: String? {
          get {
            return resultMap["site_name_long"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name_long")
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
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchRocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rocket_name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rocketName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket_name": rocketName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rocketName: String? {
          get {
            return resultMap["rocket_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_name")
          }
        }
      }
    }
  }
}
