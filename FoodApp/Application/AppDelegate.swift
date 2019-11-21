//
//  AppDelegate.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 19/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let disposeBag = DisposeBag()
    private let userService = UserService()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        userService.loadRecipes()
            .map { [unowned self] in self.getRootViewController(withRecipes: $0) }
            .subscribe(onNext: { [unowned self] in self.setWindow($0) })
            .disposed(by: disposeBag)
        
        return true
    }
    
    private func setWindow(_ vc: UIViewController) {
        window = UIWindow()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
    private func getRootViewController(withRecipes recipes: [Recipe]) -> UIViewController {
        var vc = RecipeListViewController.initFromNib()
        vc.bind(to: RecipeListViewModel(withRecipes: recipes))
        
        return UINavigationController(rootViewController: vc)
    }
}
