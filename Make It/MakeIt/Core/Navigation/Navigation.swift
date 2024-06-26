//
//  Navigation.swift
//  MakeIt
//
//  Created by Allan Soberanski on 28/06/24.
//

import UIKit
import SwiftUI

public var navigation = Navigation.shared

final public class Navigation {
    
    private(set) var rootViewController: UINavigationController?

    static var shared = Navigation()
    
    private init() {}
    
    func push(_ view: some View, animated: Bool = true) {
        let hostingViewController = UIHostingController(rootView: view)
        rootViewController?.pushViewController(hostingViewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        rootViewController?.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool = true) {
        rootViewController?.popToRootViewController(animated: animated)
    }
    
    func setRootView(_ view: some View) {
        let hostingViewController = UIHostingController(rootView: view)
        let navigation = UINavigationController(rootViewController: hostingViewController)
        navigation.navigationBar.prefersLargeTitles = true
        rootViewController = navigation
    }
    
    func changeRootViewOfStack(_ view: some View) {
        let hostingViewController = UIHostingController(rootView: view)
        rootViewController?.viewControllers = [hostingViewController]
    }
    
    func present(_ view: some View, animated: Bool = true, style: UIModalPresentationStyle = .automatic, completion: (() -> Void)? = nil) {
        let hostingViewController = UIHostingController(rootView: view)
        hostingViewController.modalPresentationStyle = style
        rootViewController?.present(hostingViewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: animated, completion: completion)
    }
}
