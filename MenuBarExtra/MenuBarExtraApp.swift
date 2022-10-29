//
//  MenuBarExtraApp.swift
//  MenuBarExtra
//
//  Created by Michele Manniello on 29/10/22.
//

import SwiftUI

@main
struct MenuBarExtraApp: App {
    var body: some Scene {
//        MARK: If You Want both macOS App And Menu Bar App
//        Then Add Window Group And MenuBarExtra
//        WindowGroup{
//            ContentView()
//        }
//       MARK: For Menu Bar App Simply Remove the Window Group
//        And Add MenuBarExtra
      
        MenuBarExtra{
         ControlCenterView()
        }label:{
            Image(systemName: "switch.2")
        }
        .menuBarExtraStyle(.window)
//        MARK: Menu Bar Style
//        1.Menu (List Type)
//        2.Window (View Type)
    }
    @ViewBuilder
    func ControlCenterView() -> some View {
//        MARK: Instead Of VStack, HStack, I'm going to Use Grid Witch is Available from macos 13
        Grid(horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow(alignment: .top){
                VStack(spacing: 12) {
                    ControlView(icon: "wifi.circle.fill", title: "Wi-Fi", subTitle: "Home Wifi")
                    ControlView(icon: "wave.3.right.circle.fill", title: "Bluetooth", subTitle: "Magic Mouse")
                    ControlView(icon: "airplayvideo.circle.fill", title: "AirDrop", subTitle: "Contacts Only")
                }
                .padding(12)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.ultraThinMaterial)
                }
                Grid(verticalSpacing: 12){
                    GridRow{
                        HStack{
                            Image(systemName: "moon.circle.fill")
                                .font(.largeTitle)
                                .symbolRenderingMode(.multicolor)
                                .foregroundStyle(.purple,.primary)
                            
                            
                            Text("Do Not Disturb")
                                .font(.callout)
                                .foregroundColor(.primary)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(12)
                        .background{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.ultraThinMaterial)
                        }
                        .gridCellColumns(2)
                        
                    }
                    GridRow{
                        SubControlView(icon: "rectangle.3.group", title: "Stage\nManager")
                        
                        SubControlView(icon: "rectangle.fill.on.rectangle.fill", title: "Screen\nMirroring")
                    }
                }
                .gridCellUnsizedAxes(.vertical)
            }
            
            GridRow{
                VStack{
                    DisabledSeeker(icon: "sun.max", title: "Display")
                    
                    DisabledSeeker(icon: "airpodspro", title: "Sound")
                    
                   
                }
                .gridCellColumns(2)
            }
        }
        .padding(10)
        .frame(width: screenSize.width / 5.5)
    }
    
//    MARK: Disabled Seeker
    @ViewBuilder
    func DisabledSeeker(icon: String,title:String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.callout)
                .foregroundColor(.primary)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.white)
                    .opacity(0.25)
                
                Image(systemName: icon)
                    .foregroundStyle(.thickMaterial)
                    .padding(.leading,8)
            }
            .frame(height: 25)
        }
        .padding(12)
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
    
    @ViewBuilder
    func SubControlView(icon:String,title:String) -> some View {
        VStack(spacing:4){
            Image(systemName: icon)
                .font(.title2)
            
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
    
//    MARK: Control View (Wi-Fi,etc)
    @ViewBuilder
    func ControlView(icon:String,title:String,subTitle:String) -> some View {
        
        HStack(spacing:5){
            Image(systemName: icon)
                .font(.largeTitle)
//            MARK: Since We're going to apply multiple color's on SFSymbol
                .symbolRenderingMode(.multicolor)
                .foregroundStyle(.blue,.white)
            
            VStack(alignment: .leading, spacing: 1) {
                Text(title)
                    .font(.callout)
                    .foregroundColor(.primary)
                
                Text(subTitle)
                    .font(.caption2)
                    .foregroundColor(.primary)
                    .opacity(0.7)
                
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
//    MARK: macOS Screen Size
    var screenSize : CGSize = {
        guard let size = NSScreen.main?.visibleFrame.size else{
            return .zero
        }
        return size
    }()
    
}
