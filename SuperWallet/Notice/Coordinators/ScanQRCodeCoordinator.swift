// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import QRCodeReaderViewController

protocol ScanQRCodeCoordinatorDelegate: class {
    func didCancel(in coordinator: ScanQRCodeCoordinator)
    func didScan(result: String, in coordinator: ScanQRCodeCoordinator)
}

final class  ScanQRCodeCoordinator: NSObject, Coordinator {
    var coordinators: [Coordinator] = []
    weak var delegate: ScanQRCodeCoordinatorDelegate?

    let navigationController: NavigationController
    lazy var qrcodeController: QRCodeReaderViewController = {
        let controller = QRCodeReaderViewController(cancelButtonTitle: R.string.localizable.cancel())
        controller.delegate = self
        controller.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismiss))
        controller.delegate = self
        return controller
    }()
}
