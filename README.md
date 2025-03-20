# flutter_mobile_banking

Mobile Banking system demo for final Lab Test
## About

The task was to create a simple welcome view that displays a login message as well as the date today. 
Then imported two JSON files (accounts, transactions) in order to iterate through them and display them accordingly

![demo](/assets/output.gif)

## Constraints
- The transactions.json must only be shown depending on the viewed account (savings, chequing)

# Widgets
- AppBar 
  - Text (Welcome Message)
  - Text (Date Today)
  - Column
    - ListTile
      - Accounts
        - Button -> transaction_screen.dart

# Transaction screen
- List of transactions
- back button to go back to the welcome page

# Classes
- MyHomePage 
  - Initializes List<dynamic> accounts
  - loadJsonData()

