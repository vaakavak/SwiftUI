//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Евгений Шилов on 08.09.2023.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
