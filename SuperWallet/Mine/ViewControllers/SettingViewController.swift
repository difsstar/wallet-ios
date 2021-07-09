// Copyright DApps Platform Inc. All rights reserved.

import UIKit
import Eureka
import SnapKit
import PromiseKit
import MBProgressHUD

protocol SettingViewControllerDelegate: class {
    func didAction(action: SettingsAction, in viewController: SettingViewController)
    func didSelectChain()
}

class SettingViewController: FormViewController {
    private var config = Config()
    weak var delegate: SettingViewControllerDelegate?
    lazy var footerView: UIView = {
        let footerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 144))
        let logoutButton: UIButton = UIButton(type: .custom)
        logoutButton.setBackgroundColor(Colors.red, forState: .normal)
        logoutButton.layer.cornerRadius = 4
        logoutButton.layer.masksToBounds = true
        logoutButton.setTitleColor(Colors.white, for: .normal)
        logoutButton.setTitle(R.string.localizable.settingLogoutTitle(), for: .normal)
        footerView.addSubview(logoutButton)
        logoutButton.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(edgeWidth)
            make.trailing.equalToSuperview().offset(-edgeWidth)
            make.height.equalTo(48)
        })
        return footerView
    }()

    let session: WalletSession
    let keystore: Keystore

    init(
        session: WalletSession,
        keystore: Keystore
        ) {
        self.session = session
        self.keystore = keystore
        super.init(nibName: nil, bundle: nil)
    }

}
