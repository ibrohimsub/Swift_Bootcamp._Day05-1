print("--------------async-await--------------")

func checkStringLength(_ collection: [String]) async -> Bool {
    for item in collection {
        if item.count <= 5 {
            return false
        }
    }
    
    return true
}

let collection = ["hello", "world", "apple", "orange"]
let result = await checkStringLength(collection)

if result {
    print("All strings are longer than 5 characters")
} else {
    print("Not all strings are longer than 5 characters")
}

///////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func areAllStringsLongerThanFive(_ strings: [String]) -> Single<Bool> {
    let stringObservables = strings.map { Observable.just($0) }
    let lengthCheckObservables = stringObservables.map { $0.map { $0.count > 5 } }
    return Observable.combineLatest(lengthCheckObservables)
        .map { $0.allSatisfy { $0 } }
        .asSingle()
}


let strings = ["apple", "orange", "banana", "kiwi", "grape", "watermelon"]

areAllStringsLongerThanFive(strings)
    .subscribe(onSuccess: { allLong in
        if allLong {
            print("All strings are longer than 5 characters")
        } else {
            print("Not all strings are longer than 5 characters")
        }
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: DisposeBag())
