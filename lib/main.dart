import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:preconsultnewflow/presentation/controllers/dataController.dart';
import 'package:preconsultnewflow/presentation/exporters/routesExporter.dart';
import 'package:preconsultnewflow/presentation/exporters/utilsExporter.dart';
import 'package:preconsultnewflow/presentation/views/mainModules/followUpModule/followUpModuleMain.dart';
import 'package:preconsultnewflow/presentation/views/mainModules/preConsultationModule/preConsultationModuleMain.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//START POINT OF THE APPLICATION
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //FIREBASE INITIALISATION
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD-uzv1nLCQe5UQqNLjarJhf1sGjHmzxjQ',
        appId: '1:599648696062:android:fa8da0de0d729e226d17af',
        messagingSenderId: '599648696062',
        projectId: 'medongo-tabapp',
        databaseURL: 'https://medongo-tabapp.firebaseio.com',
        storageBucket: 'medongo-tabapp.appspot.com',
      )
  );


  //RUNS THE MAIN APP
  runApp(const MainAppExporter());
}

//GET MATERIAL APP
class MainAppExporter extends StatelessWidget {
  const MainAppExporter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appTitle,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      getPages: AppPages.pages,
      routes: {
        AppRoutes.preConsultation: (context) => const PreConsultationModuleMain(),
        AppRoutes.followUpPatient: (context) => const FollowUpModuleMain(),
      },

      initialRoute: AppRoutes.questionsPageNew,
    );
  }
}
