// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import TrustCore
import UIKit
import RealmSwift
protocol MineCoordinatorDelegate: class {
    func didSelectChain()
    func selectWalletTab()
}

final class MineCoordinator: Coordinator {

    let navigationController: NavigationController
    let keystore: Keystore
    let session: WalletSession
    let walletStorage: WalletStorage
    weak var delegate: MineCoordinatorDelegate?
    var coordinators: [Coordinator] = []
 
    lazy var rootViewController: MineViewController = {
        let controller = MineViewController(
            session: session,
            keystore: keystore
        )
        controller.delegate = self
        controller.modalPresentationStyle = .pageSheet
        return controller
    }()

}
