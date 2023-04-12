print("--------------async-await--------------")

func hasNonEmptyStrings(_ strings: [String]) async -> Bool {
    for str in strings {
        if str.isEmpty {
            return false
        }
    }
    return true
}

async let nonEmpty = hasNonEmptyStrings(["foo", "", "bar", "baz"])
if await nonEmpty {
    print("All strings are non-empty")
} else {
    print("There is at least one empty string")
}

/////////////////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func hasNonEmptyStringsR(_ strings: [String]) -> Single<Bool> {
    let stringObservables = strings.map { Observable.just($0) }
    let nonEmptyObservables = stringObservables.map { $0.map { !$0.isEmpty } }
    return Observable.combineLatest(nonEmptyObservables)
        .map { $0.allSatisfy { $0 } }
        .asSingle()
}

let strings = ["foo", "", "bar", "baz"]
hasNonEmptyStringsR(strings)
    .subscribe(onSuccess: { result in
        if result {
            print("All strings are non-empty")
        } else {
            print("There is at least one empty string")
        }
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: DisposeBag())
