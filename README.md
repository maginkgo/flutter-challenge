# Flutter Challenge

## Instructions

In this project, the candidate shall develop a Flutter​ app as simple as possible, that addresses the
following features:

1. It can be installed in any **​Android** version​ between 4.1 and 10. The app will not be tested in iOS, for simplicity.
2. When launched, it should display an image that the candidate choses, in a **splash screen​**.
3. The home screen should display a **Text Input​**, where a user can input a cryptocurrency name. Then the user can tap a button, and:
    a. If the input text corresponds to a **valid​** coin, that coin should be **added​** to a coin list.
    b. If it does **not​** correspond to a **valid​** coin, a **snackbar​** should appear, stating that in a text message.
4. In a different **tab​** , the list of added coins is displayed. Next to each coin, its **price​** in dollars
shall be shown.
    a. When this tab loads, if there are no coins stored yet, there should be a text saying that.
    b. If there’s one or more coins stored, the tab should show the information mentioned above and fetch new data from the API, changing the values displayed as it completes the request and storing the new information.
5. The list of added coins shall be saved in **shared preferences**, in order for those data to be stored.

## Bonus

The following features are optional, but will certainly be taken as a strong plus if resolved:
- It would be nice to have the coin list sorted​ alphabetically.
- A model​ could be implemented for serializing​ the Coins
(​ https://pub.dev/packages/json_serializable​ ).
- A user would definitely enjoy switching between Light and Dark themes.

## Notes

- Coingecko offers a free API​ without even the need of a key. These two endpoints may come in handy when checking the validity and price of the coins:  
    ○ https://api.coingecko.com/api/v3/coins/list  
    ○ https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false
- You may need additional endpoints. Feel free to use as many as you want.

## Start

In order to help you get going, we provide you with a project **already started​**. Find it at
https://github.com/AndinaDeFi/flutter-challenge​.

**Fork​** the project and, when you are ready, provide us with a link to the forked project along with
the installable **APKs**.