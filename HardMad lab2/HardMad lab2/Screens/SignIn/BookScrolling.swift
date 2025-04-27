//
//  SwiftUIView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 14.03.2025.
//

import SwiftUI

struct IdentifiableImage: Identifiable {
    let id = UUID()
    let name: String
}

struct InfiniteCarouselView<Content: View, Item: RandomAccessCollection, ID: Hashable>: View {
    var items: Item
    var width: CGFloat
    var spacing: CGFloat
    var id: KeyPath<Item.Element, ID>
    @ViewBuilder var content: (Item.Element) -> Content

    @State private var scrollOffset: CGFloat = 0
    @State private var timer: Timer?

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
                .offset(x: -scrollOffset)
            }
            .disabled(true)
            .onAppear {
                startAutoScroll(totalWidth: CGFloat(items.count) * (width + spacing))
            }
            .onDisappear {
                stopAutoScroll()
            }
        }
    }

    private func startAutoScroll(totalWidth: CGFloat) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            scrollOffset += 0.8

            if scrollOffset >= totalWidth {
                scrollOffset = 0
            }
        }
    }

    private func stopAutoScroll() {
        timer?.invalidate()
        timer = nil
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

                context.coordinator.startAutoScroll(scrollView: scrollView)
            }
        }
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        var width: CGFloat
        var spacing: CGFloat
        var itemsCount: Int
        var repeatingCount: Int

        private var timer: Timer?

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

        func startAutoScroll(scrollView: UIScrollView) {
            stopAutoScroll()

            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                let newOffset = scrollView.contentOffset.x + 2
                scrollView.setContentOffset(CGPoint(x: newOffset, y: 0), animated: false)

                let contentWidth = CGFloat(self.itemsCount) * (self.width + self.spacing)
                if newOffset >= contentWidth {
                    scrollView.contentOffset.x = 0
                }
            }
        }

        func stopAutoScroll() {
            timer?.invalidate()
            timer = nil
        }
    }
}
