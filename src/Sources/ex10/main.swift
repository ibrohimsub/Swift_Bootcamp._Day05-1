print("--------------async-await--------------")

struct Item {
    let id: Int
    let value: String
}

func countElementsByGroup(items: [Item]) async -> [(id: Int, count: Int)] {
    var groupCounts = [Int: Int]()

    for item in items {
        groupCounts[item.id, default: 0] += 1
    }

    return groupCounts.map { ($0.key, $0.value) }
}


let items = [Item(id: 1, value: "foo"), Item(id: 2, value: "bar"), Item(id: 1, value: "baz")]
let result = await countElementsByGroup(items: items)

for (id, count) in result {
    print("Group \(id) has \(count) elements")
}

/////////////////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func countElementsByGroupR(items: [Item]) -> Single<[(id: Int, count: Int)]> {
    return Single.create { single in
        let groupCounts = Dictionary(grouping: items, by: { $0.id })
            .mapValues { $0.count }
            .sorted { $0.key < $1.key }
        
        single(.success(groupCounts.map { ($0.key, $0.value) }))
        return Disposables.create()
    }
}

let itemsR = [Item(id: 1, value: "foo"), Item(id: 2, value: "bar"), Item(id: 1, value: "baz")]
let disposeBag = DisposeBag()

countElementsByGroupR(items: itemsR)
    .subscribe(onSuccess: { result in
        for (id, count) in result {
            print("Group \(id) has \(count) elements")
        }
    })
    .disposed(by: disposeBag)


