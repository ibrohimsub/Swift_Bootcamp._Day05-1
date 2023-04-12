print("--------------async-await--------------")
func filterCollection(_ collection: [String]) async -> [String] {
    var filteredCollection = [String]()
    
    for item in collection {
        if item.contains("e") {
            filteredCollection.append(item)
        }
    }
    
    return filteredCollection
}


let collection = ["hello", "world", "apple", "orange"]
let filteredCollection = await filterCollection(collection)
    
print(filteredCollection)

////////////////////////////////
print("--------------async-await--------------")

import RxSwift

func filterCollectionR(_ firstCollection: [String]) -> Observable<String> {
    let observable = Observable.from(firstCollection)
    let filteredObservable = observable.filter { string in
        return string.contains("e")
    }
    return filteredObservable
}

let strings = ["hello", "world", "apple", "orange"]
let filteredCollectionR = filterCollectionR(strings)

_ = filteredCollectionR.subscribe(onNext: { element in
    print(element)
})

