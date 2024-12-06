import UIKit
import ScreenGuard // Import the ScreenGuard package

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var screenshotViewModel: ScreenshotViewModel!
    var dismissableOverlay: ScreenshotOverlayView? // Use the custom overlay from the package

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()

        // Initialize ScreenshotViewModel
        screenshotViewModel = ScreenshotViewModel()

        // Start observing for screenshots
        screenshotViewModel.startObserving()

        // Set up callback to show overlay when a screenshot is detected
        screenshotViewModel.onScreenshotDetected = { [weak self] in
            DispatchQueue.main.async {
                self?.showCustomBottomView() // Show at the bottom
            }
        }
    }

    // Function to show the custom bottom view
    func showCustomBottomView() {
        guard let window = window else { return }

        // Create the custom bottom view
        let bottomView = UIView()
        bottomView.backgroundColor = .lightGray
        bottomView.layer.cornerRadius = 10
        bottomView.clipsToBounds = true
        bottomView.frame = CGRect(x: 0, y: 0, width: window.bounds.width, height: window.bounds.height * 0.3) // Only height matters now

        // Add buttons to the bottom view
        let buttonWidth = bottomView.bounds.width * 0.2
        let buttonHeight = bottomView.bounds.height * 0.6
        let buttonSpacing = bottomView.bounds.width * 0.05

        for i in 0..<4 {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: CGFloat(i) * (buttonWidth + buttonSpacing) + buttonSpacing,
                                  y: (bottomView.bounds.height - buttonHeight) / 2,
                                  width: buttonWidth,
                                  height: buttonHeight)
            button.setTitle("Button \(i + 1)", for: .normal)
            button.backgroundColor = .blue
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            bottomView.addSubview(button)
        }

        // Use ScreenshotOverlayView with the `bottom` position
        let overlayView = ScreenshotOverlayView(frame: window.bounds, customView: bottomView, position: .bottom)
        window.addSubview(overlayView)

        // Store the overlay view reference
        self.dismissableOverlay = overlayView
    }

    // Function to handle button tap
    @objc func buttonTapped(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            print("\(title) pressed!")
        }
    }

    // Function to create the tab bar controller
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.viewControllers = [createSearchNC(), createFavouritesNC()]
        return tabbar
    }

    // Function to create the search navigation controller
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC() // Replace with your actual view controller
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }

    // Function to create the favourites navigation controller
    func createFavouritesNC() -> UINavigationController {
        let favouritesVC = FavouritesListVC() // Replace with your actual view controller
        favouritesVC.title = "Favourites"
        favouritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favouritesVC)
    }
}
