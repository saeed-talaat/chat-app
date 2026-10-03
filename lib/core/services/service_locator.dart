import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo_imple.dart';
import 'package:chat_app/features/auth/domain/repos/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:chat_app/features/contacts/data/datasource/contacts_remote_data_source.dart';
import 'package:chat_app/features/contacts/data/repos/contact_repo_imple.dart';
import 'package:chat_app/features/contacts/domain/repos/contact_repo.dart';
import 'package:chat_app/features/contacts/presentation/cubits/cubit/contact_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Data Source
 
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<DatabaseService>(() => FirestoreService());

 getIt.registerLazySingleton<ContactsRemoteDataSource>(
    () => ContactsRemoteDataSourceImpl(databaseService: getIt<DatabaseService>()),
  );


  

  // Repository
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImple(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );


  getIt.registerLazySingleton<ContactRepo>(
    () => ContactRepoImple(contactsRemoteDataSource: 
    getIt<ContactsRemoteDataSource>()
      
    ),
  );


  // Cubit
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(authRepo: getIt<AuthRepo>()),
  );


   getIt.registerFactory<ContactCubit>(
    () => ContactCubit(contactRepo:getIt<ContactRepo>() ),
  );
}
