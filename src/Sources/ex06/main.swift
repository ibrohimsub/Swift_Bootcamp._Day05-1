print("--------------async-await--------------")

func totalLengthOfStrings(_ strings: [String]) async -> Int {
    var totalLength = 0
    for str in strings {
        totalLength += str.count
    }
    return totalLength
}

let strings = ["foo", "bar", "baz"]
let totalLength = await totalLengthOfStrings(strings)
print("Total length of strings: \(totalLength)")


/////////////////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func totalLengthOfStringsR(_ strings: [String]) -> Single<Int> {
    let stringObservables = strings.map { Observable.just($0) }
    let lengthObservables = stringObservables.map { $0.map { $0.count } }
    return Observable.combineLatest(lengthObservables)
        .map { $0.reduce(0, +) }
        .asSingle()
}

let collection = ["foo", "bar", "baz"]
totalLengthOfStringsR(collection)
    .subscribe(onSuccess: { totalLength in
        print("Total length of strings: \(totalLength)")
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: DisposeBag())
