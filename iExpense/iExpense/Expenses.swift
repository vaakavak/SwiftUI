//
//  Expenses.swift
//  iExpense
//
//  Created by Евгений Шилов on 08.09.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
