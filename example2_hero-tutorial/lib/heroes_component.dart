import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'hero.dart';
import 'hero_detail_component.dart';
import 'hero_service.dart';

@Component(
    selector: 'my-heroes',
    templateUrl: 'heroes_component.html',
    styleUrls: const ['heroes_component.css']
)
class HeroesComponent implements OnInit {
  final Router _router;
  final HeroService _heroService;

  List<Hero> heroes;
  Hero selectedHero;

  HeroesComponent(this._heroService, this._router);

  void ngOnInit() {
    getHeroes();
  }

  Future<Null> getHeroes() async {
//    heroes = await _heroService.getHeroesSlowly();
    heroes = await _heroService.getHeroes();
  }

  onSelect(Hero hero) {
    selectedHero = hero;
  }

  Future<Null> gotoDetail() =>
      _router.navigate(['HeroDetail', {'id': selectedHero.id.toString()}]);

  Future<Null> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return;
    heroes.add(await _heroService.create(name));
    selectedHero = null;
  }

  Future<Null> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selectedHero == hero) selectedHero = null;
  }

}