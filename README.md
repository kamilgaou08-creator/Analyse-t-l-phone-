# PHONE ANALYST

Application Android locale d'analyse du temps d'utilisation des applications.

## Fonctionnalités

- Tableau de bord avec temps total et applications les plus utilisées.
- Périodes d'analyse : aujourd'hui, 7 jours et 30 jours.
- Liste et détail des applications observées.
- Historique agrégé fourni par Android.
- Recommandations explicables et objectif quotidien réglable.
- Export PDF, CSV et TXT via le sélecteur de fichiers Android.
- Thème clair/sombre.
- Aucune transmission réseau des statistiques.

## Configuration

- Android Studio récent ou environnement Gradle.
- JDK 17.
- Android SDK 35.
- Gradle 8.9.
- Android Gradle Plugin 8.7.3.
- Kotlin 2.0.21.
- Android minimum : API 26 (Android 8.0).

## Autoriser l'accès aux statistiques

1. Ouvrir PHONE ANALYST.
2. Appuyer sur **Activer l'accès**.
3. Android ouvre « Accès aux données d'utilisation ».
4. Sélectionner PHONE ANALYST et autoriser l'accès.
5. Revenir dans l'application et actualiser.

Cette autorisation spéciale n'est pas une permission runtime classique. L'utilisateur l'active manuellement dans les paramètres Android.

## Limites Android

- `UsageStatsManager` renvoie des statistiques agrégées, pas le contenu ni les actions privées effectuées dans les applications.
- Les durées et l'historique dépendent des données conservées par Android et du constructeur.
- Les sessions ne sont pas calculées ici : les événements peuvent être incomplets selon l'appareil et la période. L'application préfère afficher « non disponible » plutôt que d'inventer un nombre.
- Les durées agrégées peuvent inclure des comportements système spécifiques et ne correspondent pas nécessairement à une mesure chronométrique parfaite.
- L'application n'analyse pas les frappes clavier, mots de passe, SMS, conversations, microphone, caméra ou localisation.

## Compilation avec GitHub Actions depuis Android

1. Télécharger puis extraire `PHONE_ANALYST.zip`.
2. Créer un dépôt GitHub vide nommé `PHONE_ANALYST`.
3. Depuis le navigateur Android, ouvrir le dépôt et utiliser **Add file > Upload files**.
4. Envoyer le contenu du dossier `PHONE_ANALYST` (y compris `.github` ; si l'interface mobile ne permet pas l'envoi de dossiers, utiliser GitHub Desktop sur ordinateur ou l'application/éditeur Git de votre choix).
5. Valider le commit sur `main`.
6. Ouvrir l'onglet **Actions** du dépôt.
7. Attendre la fin du workflow **Android CI - PHONE ANALYST**.
8. Ouvrir l'exécution réussie et télécharger l'artefact `phone-analyst-debug-apk`.
9. Extraire l'artefact ZIP puis installer `app-debug.apk`. Android peut demander d'autoriser l'installation depuis cette source.

## Compilation locale

Avec Gradle 8.9 et JDK 17 installés :

```bash
gradle testDebugUnitTest
gradle assembleDebug
```

L'APK sera généré ici :

```text
app/build/outputs/apk/debug/app-debug.apk
```

### À propos du Gradle Wrapper

Le wrapper standard requiert un binaire `gradle-wrapper.jar`. Il n'a pas pu être récupéré dans l'environnement de génération de cette archive. Le dépôt contient `gradle-wrapper.properties` et des scripts de secours qui utilisent une installation Gradle locale, mais pas le binaire `gradle-wrapper.jar`. Le workflow GitHub Actions installe Gradle 8.9, génère le wrapper officiel dans l'environnement CI, puis utilise `./gradlew` pour les tests et la compilation. Pour ajouter le wrapper complet au dépôt depuis un ordinateur disposant de Gradle 8.9, exécuter `gradle wrapper --gradle-version 8.9`, puis envoyer les fichiers générés (`gradlew`, `gradlew.bat` et `gradle/wrapper/gradle-wrapper.jar`).

## Arborescence

- `app/src/main/java/com/phoneanalyst`: application Kotlin.
- `data/local`: accès Android UsageStats.
- `data/repository`: dépôt de données.
- `domain/model`: modèles.
- `analytics`: recommandations.
- `export`: export PDF/CSV/TXT.
- `presentation`: écrans et ViewModel.
- `app/src/test`: tests unitaires.
- `.github/workflows/main.yml`: compilation automatisée.

## Confidentialité

Les statistiques sont lues sur l'appareil et ne sont pas envoyées à un serveur. Les fichiers exportés sont écrits uniquement à l'emplacement choisi dans le sélecteur Android. L'accès peut être révoqué à tout moment dans les paramètres système.
