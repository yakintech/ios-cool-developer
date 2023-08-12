//
//  JobDetailView.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 30.07.2023.
//

import SwiftUI
import WebKit

struct JobDetailView: View {
    var detail : JobDataModel = JobDataModel()
    @State private var size: CGSize = .zero;
    @EnvironmentObject var favoriteStore : FavoriteStore;
    @StateObject var favorites = FavoriteStore()


    var body: some View {
        VStack{
            ScrollView{
                
                
                AsyncImage(url: URL(string: detail.company_logo ?? ""),
                    content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 300, maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                })
                    
                Text(detail.position ?? "")
                    .padding()
                
                Text("Salary Min: \(detail.salary_min ?? 0.0)")
                    .padding()
                
                Text("Salary Max:\(detail.salary_max ?? 0.0)")
                    .padding()

                AttributedText(htmlContent: detail.description ?? "", size: $size)
                           .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: size.height, maxHeight: .infinity)
                HStack{
                    ForEach(detail.tags ?? [] , id: \.self){ item in
                        Text(item)
                            .padding()
                    }
                }
                
                Button("Add to fav"){
                    favoriteStore.favorites.append(detail)
                }
                
                Spacer()
               
                
            }
     
            
            
        }
    }
}





struct AttributedText: UIViewRepresentable {
    let htmlContent: String
    @Binding var size: CGSize
    
    private let webView = WKWebView()
    var sizeObserver: NSKeyValueObservation?
    
    func makeUIView(context: Context) -> WKWebView {
        webView.scrollView.isScrollEnabled = false //<-- Here
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: AttributedText
        var sizeObserver: NSKeyValueObservation?
        
        init(parent: AttributedText) {
            self.parent = parent
            sizeObserver = parent.webView.scrollView.observe(\.contentSize, options: [.new], changeHandler: { (object, change) in
                parent.size = change.newValue ?? .zero
            })
        }
    }
}

