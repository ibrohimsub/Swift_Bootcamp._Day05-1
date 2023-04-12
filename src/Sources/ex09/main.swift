print("--------------async-await--------------")

struct MyStruct {
    let id: Int
    let value: String
}

func groupById(items: [MyStruct]) async -> [Int: [String]] {
    var groupedById: [Int: [String]] = [:]
    for item in items {
        if var group = groupedById[item.id] {
            group.append(item.value)
            groupedById[item.id] = group
        } else {
            groupedById[item.id] = [item.value]
        }
    }
    return groupedById
}

let items = [MyStruct(id: 1, value: "foo"), MyStruct(id: 2, value: "bar"), MyStruct(id: 1, value: "baz")]
let result = await groupById(items: items)
print(result)

/////////////////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift


func groupByIdR(items: [MyStruct]) -> Single<[Int: [String]]> {
    return Observable.from(items)
        .groupBy(keySelector: { $0.id })
        .flatMap { group -> Observable<(Int, String)> in
            group.map { item in (item.id, item.value) }
        }
        .toArray()
        .map { tuples in
            var groupedById: [Int: [String]] = [:]
            for (id, value) in tuples {
                if var group = groupedById[id] {
                    group.append(value)
                    groupedById[id] = group
                } else {
                    groupedById[id] = [value]
                }
            }
            return groupedById
        }
        // .asSingle()
}

let itemsR = [MyStruct(id: 1, value: "foo"), MyStruct(id: 2, value: "bar"), MyStruct(id: 1, value: "baz")]
groupByIdR(items: itemsR)
    .subscribe(onSuccess: { result in
        print(result)
    }, onFailure: { error in
        print(error)
    })
    .disposed(by: DisposeBag())
