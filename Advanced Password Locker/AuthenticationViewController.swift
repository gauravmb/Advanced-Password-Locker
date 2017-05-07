//
//  AuthenticationViewController.swift
//  Advanced Password Locker
//
//  Created by Gaurav Bhatia on 4/14/17.
//  Copyright © 2017 Gaurav Bhatia. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageControllerIndex=0
    var maxPageViewController=2
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil)
    {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource=self
        self.setViewControllers([getViewController(WithIndex: 0)!] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLockerView() -> Void {
    
        self.performSegue(withIdentifier: "AuthenicationControllerToLockerView", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination.description)
    }
    
    
    @IBAction func buttonTapped(_ sender: Any)
    {
        self.loadLockerView()
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if(pageControllerIndex-1<0)
        {
            return nil
        }
        pageControllerIndex -= 1
        return getViewController(WithIndex: pageControllerIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if(pageControllerIndex+1==maxPageViewController)
        {
            return nil
        }
        pageControllerIndex += 1
        return getViewController(WithIndex: pageControllerIndex)
    }
    
    func getViewController(WithIndex index:Int) -> UIViewController?
    {
        var viewController:UIViewController;
        if(index==0 || index==1)
        {
            viewController = (self.storyboard?.instantiateViewController(withIdentifier:"SetPasswordView"))!
            if(index==0)
            {
//                viewController.view.backgroundColor=UIColor.green
            }
            else
            {
//                viewController.view.backgroundColor=UIColor.red
            }
            
            return viewController
        }
        return nil;
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
