//
//  FactoryPattern.swift
//  Benchtime
//
//  Created by Tosun, Irem on 2.07.2024.
//

import Foundation

protocol BankAccount {
    func registerAccount() -> String
}

struct PersonalAccount: BankAccount {
    func registerAccount() -> String {
        "Personal account is registered!"
    }
}

struct BusinessAccount: BankAccount {
    func registerAccount() -> String{
        "Business account is registered!"
    }
}

struct InvestmentAccount: BankAccount {
    func registerAccount() -> String{
        "Investment account is registered!"
    }
}

protocol AccountFactory {
    func create() -> BankAccount
}

final class PersonalAccountFactory: AccountFactory {
    func create() -> BankAccount {
        return PersonalAccount()
    }
}

final class BusinessAccountFactory: AccountFactory {
    func create() -> BankAccount {
        return BusinessAccount()
    }
}

final class InvestmentAccountFactory: AccountFactory {
    func create() -> BankAccount {
        return InvestmentAccount()
    }
}
