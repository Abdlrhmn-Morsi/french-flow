import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static final light = ThemeData(
    scaffoldBackgroundColor: AppColors.offWhite,
    fontFamily: 'Amiri',
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
  );
}




String appContent = '''
هذه قائمة بأهم عبارات التحية والترحيب باللغة الفرنسية التي تستخدم في الحياة اليومية مترجمة بالعربية
مرحبًا Salut
صباح الخير Bonjour
مساء الخير Bon après-midi
تصبح على خير Bonne nuit
كيف حالك؟ Comment allez-vous؟
بخير، شكرًا لك. Bien, merci
وأنت؟ Et vous؟
أهلاً وسهلاً Bienvenue
أتمنى لك نهارًا سعيدًا Bonne journée
وداعًا Au revoir
أراك لاحقًا À la prochaine
أراك غدًا À demain
عفوًا ( عند ارتكاب خطأ مثل ان تصطدم بشخص ما) Pardon
هل يمكنني مساعدتك؟ Puis-je vous aider?

جمل فرنسية تسخدم كثيرا في المحادثات مترجمة بالعربية يجب عليك حفضها حتى تتمكن من اتقان الفرنسية

هل تتكلم الإنجليزية؟ Parlez-vous anglais؟
العربية Arabe
الانجليزية Anglais
الفرنسية Français
نعم، قليلاً Oui, un peu
نعم Oui
لا Non
تكلم ببطء Parlez lentement
أنا لا أفهم Je ne comprends pas
هل تفهم؟ Vous comprenez?
بالتأكيد Oui, bien sûr
كرر، من فضلك Répétez, s’il vous plaît
مرة ثانية Encore
كلمة كلمة Mot à mot
ببطء Lentement
كيف تقول؟ Comment dit-on؟
ماذا يعني ذلك؟ Qu’est-ce que ça veut dire؟
ماذا قلت؟ Qu’avez-vous dit؟
هل لديك سؤال؟ Avez-vous des questions؟'''
;