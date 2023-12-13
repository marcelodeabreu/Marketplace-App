//
//  APICaller.swift
//  viewcodeAppExample
//
//  Created by Marcelo de Abreu on 13/12/23.
//

import Foundation

/*
 >>>>>>> LINK: https://stackoverflow.com/questions/45029182/how-use-steam-api-send-tradeoffer
 
 You basically need to call the url https://steamcommunity.com/tradeoffer/new/send with some parameters (Its a POST request).

 You need to know two things: SteamId (for example mine is: 68364320) and the token of the partner (for example mine is: CzTCv8JM).

 Headers

 'referer': 'https://steamcommunity.com/tradeoffer/new/?partner={{partnerId}}&token={{tradeOfferToken}}'
 Form parameters

 'sessionid': Session Id of the steamcommunity session
 'serverid': I really dont know what this means, just set it to 1
 'partner': SteamId
 'tradeoffermessage': Message appended to trade offer
 'json_tradeoffer': JSON of the offer (link)
 'captcha': Leave empty
 'trade_offer_create_params': Parameters which are needed if you dont have the partner in the friend list, see tradeofferparams.json
 'tradeofferid_countered': Leave empty i guess for you
 Now the necessary JSON's:

 tradeofferparams.json

 {
   "trade_offer_access_token":"{{tradeToken}}"
 }
 itemAsset.json (needed in json_tradeoffer.json)

 You can get those id's by requesting the users inventory + your inventory.

 {
   "appid":"appid",
   "contextid":"contextid",
   "amount":"1",
   "assetid":"assetid"
 }
 json_tradeoffer.json

 {
   "newversion":true,
   "version":4,
   "me":{
     "assets":[

     ],
     "currency":[

     ],
     "ready":false
   },
   "them":{
     "assets":[

     ],
     "currency":[

     ],
     "ready":false
   }
 }
 Leave currency empty. I guess it will never be used, assets is an array of itemAsset.json.

 For reference implementation lookup steam-awesome which lists multiple repositories with reference implementations. Most popular is probably node-steam-tradeoffer-manager where you can find the send function in this piece of code.
 */

// ------------------------------------ x ------------------------------------
 
struct Constants {
    static let API_KEY = "userAPIKey"
}

class APICaller {
    static let shared = APICaller()
}
