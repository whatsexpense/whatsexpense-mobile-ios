//
//  DisposeBag.swift
//  whatsexpense

import Combine

final class DisposeBag {
    fileprivate(set) var subscriptions = Set<AnyCancellable>()
    private let equalToAny: Bool

    init(equalToAny: Bool = false) {
        self.equalToAny = equalToAny
    }

    func cancel() {
        subscriptions.removeAll()
    }

    func isEqual(to other: DisposeBag) -> Bool {
        return other === self || other.equalToAny || self.equalToAny
    }
}

extension AnyCancellable {

    func store(in disposableBag: DisposeBag) {
        disposableBag.subscriptions.insert(self)
    }
}

