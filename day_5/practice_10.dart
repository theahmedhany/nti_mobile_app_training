void main() {
  // Hello.

  BankAccount account1 = BankAccount('123456789', 1020.0);
  account1.deposit(500.0);
  account1.withdraw(200.0);
  account1.displayBalance();
}

class BankAccount {
  String accountNumber;
  double _balance;

  BankAccount(this.accountNumber, this._balance);

  void deposit(double amount) {
    _balance += amount;
    print('Deposited: $amount');
  }

  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print('Withdrawn: $amount');
    } else {
      print('Error: Withdraw amount exceeds balance.');
    }
  }

  void displayBalance() {
    print('Account Number: $accountNumber, Balance: $_balance');
  }
}
