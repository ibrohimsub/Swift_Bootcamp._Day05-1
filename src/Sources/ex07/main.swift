print("--------------async-await--------------")

func countStrings(_ strings: [String]) async -> Int {
    return strings.count
}

let strings = ["foo", "bar", "baz"]
let count = await countStrings(strings)
print("Number of strings: \(count)")

/////////////////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func countStringsR(_ strings: [String]) -> Single<Int> {
    return Observable.just(strings.count)
        .asSingle()
}

let collection = ["foo", "bar", "baz"]
countStringsR(collection)
    .subscribe(onSuccess: { count in
        print("Number of strings: \(count)")
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: DisposeBag())
