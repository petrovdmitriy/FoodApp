//
//  Rx+Keyboard.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 06/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift

func keyboardHeight() -> Observable<CGFloat> {
    return Observable
        .from([
            NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
                .map { notification -> CGFloat in
                    (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
                },
            NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
                .map { _ in
                    CGFloat(0)
                }
        ])
        .merge()
}

extension Reactive where Base: UIScrollView {
    var contentInset: Binder<UIEdgeInsets> {
        return Binder(base) { scrollView, inset in
            scrollView.contentInset = inset
        }
    }
}

