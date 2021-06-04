//
//  Unwrapped.swift
//  CustomTabItem
//
//  Created by AJ-CHARA WAROROS on 28/5/2564 BE.
//

public func unwrapped<T: OptionalType, U>(_ wrapped: T, with castValue: U) -> T.WrappedType where T.WrappedType == U {
  if let unwrapped = wrapped.value {
    return unwrapped
  } else {
    return castValue
  }
}

public protocol OptionalType: ExpressibleByNilLiteral {
  associatedtype WrappedType
  var value: WrappedType? { get }
}

extension Optional: OptionalType {
  public var value: Wrapped? { return self }
}

public extension Optional where Wrapped: Collection {
  var isEmptyOrNil: Bool {
    return unwrapped(self?.isEmpty, with: true)
  }
}
