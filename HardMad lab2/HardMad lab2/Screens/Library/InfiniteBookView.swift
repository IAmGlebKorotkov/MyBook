//
//  InfiniteBookView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 23.03.2025.
//
import SwiftUI

struct InfiniteBookView<Content: View, Item: RandomAccessCollection, ID: Hashable>: View {
    var items: Item
    var width: CGFloat
    var spacing: CGFloat
    var id: KeyPath<Item.Element, ID>
    @ViewBuilder var content: (Item.Element) -> Content

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let repeatingCount = width > 0 ? Int((size.width / width).rounded()) + 1 : 1

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: spacing) {
                    ForEach(items, id: id) { item in
                        content(item)
                            .frame(width: width)
                    }
                    ForEach(0..<repeatingCount, id: \.self) { index in
                        let item = Array(items)[index % items.count]
                        content(item)
                            .frame(width: width)
                    }
                }
                .background {
                    ScrollViewHelper(width: width, spacing: spacing, itemsCount: items.count,
                                     repeatingCount: repeatingCount)
                }
            }
        }
    }
}

private struct ScrollViewHelper: UIViewRepresentable {
    var width: CGFloat
    var spacing: CGFloat
    var itemsCount: Int
    var repeatingCount: Int

    func makeCoordinator() -> Coordinator {
        return Coordinator(
            width: width,
            spacing: spacing,
            itemsCount: itemsCount,
            repeatingCount: repeatingCount)
    }

    func makeUIView(context: Context) -> UIView {
        return .init()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
            if let scrollView = uiView.superview?.superview?.superview as? UIScrollView,
               !context.coordinator.isAdded {
                scrollView.delegate = context.coordinator
                context.coordinator.isAdded = true
            }
        }
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        var width: CGFloat
        var spacing: CGFloat
        var itemsCount: Int
        var repeatingCount: Int

        init(width: CGFloat, spacing: CGFloat, itemsCount: Int, repeatingCount: Int) {
            self.width = width
            self.spacing = spacing
            self.itemsCount = itemsCount
            self.repeatingCount = repeatingCount
        }

        var isAdded: Bool = false

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let minX = scrollView.contentOffset.x
            let mainContentSize = CGFloat(itemsCount) * width
            let spacingSize = CGFloat(itemsCount) * spacing

            if minX > (mainContentSize + spacingSize) {
                scrollView.contentOffset.x -= (mainContentSize + spacingSize)
            }
        }
    }
}

struct ScalingEffect: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}
