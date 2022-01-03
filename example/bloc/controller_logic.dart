import 'package:rxdart/rxdart.dart';

import '../interface/interface_page.dart';

final ctrlHomeLogic = PageHomeController();

///Responsavel pela regra de negocio do modulo
class PageHomeController implements InterfacePageController {
  BehaviorSubject<int> subjectCounter = BehaviorSubject.seeded(0);

  @override
  void init() {
    if (subjectCounter.isClosed) {
      subjectCounter = BehaviorSubject.seeded(0);
    }
  }

  @override
  void dispose() {
    subjectCounter.close();
  }

  void incrementCounter() {
    subjectCounter.sink.add(subjectCounter.value + 1);
  }
}
