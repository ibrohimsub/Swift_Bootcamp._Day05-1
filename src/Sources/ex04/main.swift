print("--------------async-await--------------")

func hasLongStrings(_ strings: [String]) async -> Bool {
    for string in strings {
        if string.count > 5 {
            return true
        }
    }
    return false
}

let collection = ["hello", "world", "apple", "orange"]
let result = await hasLongStrings(collection)

if result {
    print("At least one string is longer than 5 characters")
} else {
    print("No string is longer than 5 characters")
}


//////////////////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func isAnyStringLongerThanFive(_ strings: [String]) -> Single<Bool> {
    let stringObservables = strings.map { Observable.just($0) }
    let lengthCheckObservables = stringObservables.map { $0.map { $0.count > 5 } }
    return Observable.combineLatest(lengthCheckObservables)
        .map { $0.contains { $0 } }
        .asSingle()
}

let strings = ["apple", "orange", "banana", "kiwi", "grape", "watermelon"]

isAnyStringLongerThanFive(strings)
    .subscribe(onSuccess: { isLong in
        if isLong {
            print("At least one string is longer than 5 characters")
        } else {
            print("No string is longer than 5 characters")
        }
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: DisposeBag())
