import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/router.dart';

//import 'package:angular2/platform/common.dart';
import 'package:example2_hero_tutorial/app_component.dart';
import 'package:example2_hero_tutorial/in_memory_data_service.dart';
import 'package:http/http.dart';

void main() {
  //http://stackoverflow.com/questions/37616385/angular2-routing-gives-404-when-reloading-page
  //http://stackoverflow.com/questions/40563419/angular2-dart-with-pub-serve-localhost-refresh-page-404
  bootstrap(AppComponent, [
//      provide(LocationStrategy, useClass: HashLocationStrategy)
    ROUTER_PROVIDERS,
    [provide(Client, useClass: InMemoryDataService)]
//    provide(BrowserClient, useFactory: () => new BrowserClient(), deps: [])
  ]);
}


