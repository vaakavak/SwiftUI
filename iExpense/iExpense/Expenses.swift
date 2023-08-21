//
//  Expenses.swift
//  iExpense
//
//  Created by Admin on 21.08.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
    
}
