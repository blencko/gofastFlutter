import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_aula1/app/Core/interfaces/shared_repository_interface.dart';
import 'package:projeto_aula1/app/Core/repositories/shared_repository.dart';
import 'package:projeto_aula1/app/Modules/home/home_module.dart';
import 'package:projeto_aula1/app/Modules/splash/splash_page.dart';
import 'app_controller.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  //injeção de dependencia
  List<Bind> get binds => [
       Bind<ISharedRepositoryInterface>(
          (i) => SharedRepository(),
        ),
        Bind(
          (i) => AppController(),
        ),
      ];
  @override
  // iniciando aplicação
  Widget get bootstrap => AppWidget();

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        ModularRouter(
          '/home',
          module: HomeModule(),
        ),
      ];
}
