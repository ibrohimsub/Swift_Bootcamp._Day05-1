print("--------------async-await--------------")

struct MyStruct {
    let text: String
}

func getTexts(from items: [MyStruct]) async -> [String] {
    var texts = [String]()
    for item in items {
        texts.append(item.text)
    }
    return texts
}

let items = [MyStruct(text: "foo"), MyStruct(text: "bar"), MyStruct(text: "baz")]
let texts = await getTexts(from: items)
print("Texts: \(texts)")


/////////////////////////////////////////////////
print("---------------RxSwift---------------")

import RxSwift

func getTextsR(from items: [MyStruct]) -> Single<[String]> {
    let textObservables = items.map { Observable.just($0.text) }
    return Observable.combineLatest(textObservables)
        .map { $0 }
        .asSingle()
}

let itemsR = [MyStruct(text: "foo"), MyStruct(text: "bar"), MyStruct(text: "baz")]
getTextsR(from: itemsR)
    .subscribe(onSuccess: { texts in
        print("Texts: \(texts)")
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: DisposeBag())
