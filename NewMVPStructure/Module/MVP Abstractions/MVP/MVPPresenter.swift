//
//  MVPPresenter.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

class MVPPresenter<T : MVPViewProtocol> : MVPPresenterProtocol {

    private var me: T?

    func view() -> T {
        return self.me!
    }

    func setView(view : T){
        self.me = view
    }

    func alive() -> Bool {
        return me != nil
    }

    func api() -> API {
        return API.shared
    }

    func viewStarted() {
    // log view in remote or custome event
    }
    
}
