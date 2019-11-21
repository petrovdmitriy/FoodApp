//
//  Rx+TwoWayBinding.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 15/10/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift

infix operator <->

@discardableResult
func <-> <T>(property: ControlProperty<T>, variable: BehaviorRelay<T>) -> Disposable {
    let variableToProperty = variable.asObservable()
        .bind(to: property)

    let propertyToVariable = property
        .subscribe(
            onNext: { variable.accept($0) },
            onCompleted: { variableToProperty.dispose() }
        )

    return Disposables.create(variableToProperty, propertyToVariable)
}
