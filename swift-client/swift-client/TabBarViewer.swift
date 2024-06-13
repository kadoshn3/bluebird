//
//  TabBarViewer.swift
//  swift-client
//
//  Created by Neeve Kadosh on 5/31/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationView {
//                ActivitiesContentView(activtiesData: Activities(data: ActivitiesMockStore.activityData, items: ActivitiesMockStore.activities))
            }
            .tag(0)
            .tabItem {
                Image("activity-1")
                    .resizable()
                Text("Activities")
            }
            
            NavigationView {
//                ActivitiesCartView(ShoppingCartItemsData: ActivitiesCart(data: ActivitiesMockStore.shoppingCartData))
            }
            .tag(1)
            .tabItem {
                Image("shopping-cart-icon")
                Text("Cart")
            }
            
            NavigationView {
//                     AccountView()
                  }
                   .tag(2)
                    .tabItem {
                    Image("profile-glyph-icon")
                    Text("Account")
                }
        }
    }
}



