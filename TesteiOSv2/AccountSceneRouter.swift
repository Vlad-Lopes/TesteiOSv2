//
//  AccountSceneRouter.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 14/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol AccountSceneRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol AccountSceneDataPassing
{
  var dataStore: AccountSceneDataStore? { get }
}

class AccountSceneRouter: NSObject, AccountSceneRoutingLogic, AccountSceneDataPassing
{
  weak var viewController: AccountSceneViewController?
  var dataStore: AccountSceneDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: AccountSceneViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: AccountSceneDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
