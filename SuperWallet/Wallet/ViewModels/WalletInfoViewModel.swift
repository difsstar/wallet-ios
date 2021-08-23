// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import TrustKeystore

struct FormSection {
    let footer: String?
    let header: String?
    let rows: [WalletInfoType]

    init(footer: String? = .none, header: String? = .none, rows: [WalletInfoType]) {
        self.footer = footer
        self.header = header
        self.rows = rows
    }
}

struct WalletInfoViewModel {

    let wallet: WalletInfo

    init(
        wallet: WalletInfo
    ) {
        self.wallet = wallet
    }

    var title: String {
        return R.string.localizable.manage()
    }

}
