print("--------------async-await--------------")

func findFirstElementStartingWithTH(in collection: [String]) async -> String? {
    for item in collection {
        if item.hasPrefix("th") {
            return item
        }
    }
    
    return nil
}

let collection = ["theater", "theme", "hello", "world", "apple", "orange", "this is it"]
if let result = await findFirstElementStartingWithTH(in: collection) {
    print(result)
} else {
    print("No element starting with \"th\" was found.")
}

/////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func findFirstElementStartingWithTh(in collection: [String]) -> Single<String> {
    return Observable.from(collection)
        .filter { $0.hasPrefix("th") }
        .take(1)
        .asSingle()
}

let strings = ["theater", "theme", "hello", "world", "apple", "orange", "this is it"]

findFirstElementStartingWithTh(in: strings)
    .subscribe(onSuccess: { result in
        print(result)
    }, onFailure: { error in
        print("No element starting with \"th\" was found.")
    })
    .disposed(by: DisposeBag())
