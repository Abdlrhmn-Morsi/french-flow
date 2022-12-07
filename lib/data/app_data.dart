import 'package:flutter/animation.dart';

import '../core/themes.dart';

class Unit {
  final String? title;
  final String? description;
  final String? img;
  final List<Lesson>? lesson;
  Unit({
    this.img,
    this.title,
    this.lesson,
    this.description,
  });
}

class Lesson {
  final String? title;
  final String? description;
  final String? img;

  final FrenchClass? frenchClass;

  Lesson({
    this.img,
    this.title,
    this.frenchClass,
    this.description,
  });
}

class FrenchClass {
  final String? title;
  final String? description;
  final String? paragraph1;
  final String? paragraph2;
  final String? paragraph3;
  final String? img;

  final List<QuizFrench>? quizfrench;
  FrenchClass({
    this.img,
    this.title,
    this.description,
    this.quizfrench,
    this.paragraph1,
    this.paragraph2,
    this.paragraph3,
  });
}

class QuizFrench {
  final String quistion;
  final List options;
  final String correctAnswer;
  bool? isCorrectAnswer;
  int? chosenAnswer;
  Color? statsColor;
  QuizFrench({
    this.statsColor,
    required this.quistion,
    required this.options,
    required this.correctAnswer,
    this.isCorrectAnswer,
    this.chosenAnswer,
  });
}

List<Unit> units = [
  Unit(
    title: 'الوحده الاولي',
    description: 'تعليم اساسيات الفرنسيه',
    img: 'assets/icons/1.jpg',
    lesson: [
      Lesson(
        title: 'الدرس الاول',
        description:
            'Le lundi, David reste toute la journée à l’école. Souvent, le soir, il pratique une activité musicale',
        img: 'assets/images/student_img_3.jpg',
        frenchClass: FrenchClass(
          title: 'التحية باللغة الفرنسية Salutations',
          description: appContent,
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'Comment allez-vous..',
              options: [
                ['A', 'Je vais bien, et vous?'],
                ['B', 'Bien, merci'],
                ['C', 'Pas trop mal'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'Comment tu t’appelles?',
              options: [
                ['A', 'Un peu'],
                ['B', 'Je ne parle pas bien français'],
                ['C', 'Je m’appelle..'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'D’où viens-tu?',
              options: [
                ['A', 'Je ne comprends pas'],
                ['B', 'Je viens de ..'],
                ['C', 'Il fait froid'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الثاني',
        description:
            'Le lundi, David reste toute la journée à l’école. Souvent, le soir, il pratique une activité musicale',
        img: 'assets/images/student_img_2.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الثاني',
        description:
            'Le lundi, David reste toute la journée à l’école. Souvent, le soir, il pratique une activité musicale',
        img: 'assets/images/student_img_3.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الرابع',
        description:
            'Le lundi, David reste toute la journée à l’école. Souvent, le soir, il pratique une activité musicale',
        img: 'assets/images/student_img_4.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
    ],
  ),
  Unit(
    title: 'الوحده الثانيه',
    description: 'تعليم المحادثات اليوميه ',
    img: 'assets/icons/2.jpg',
    lesson: [
      Lesson(
        title: 'الدرس الاول',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_1.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الثاني',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_2.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
    ],
  ),
  Unit(
    title: 'الوحده الثالثه',
    description: 'تعليم العاميه الفرنسيه',
    img: 'assets/icons/7.jpg',
    lesson: [
      Lesson(
        title: 'الدرس الاول',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_1.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الثاني',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_2.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
    ],
  ),
  Unit(
    title: 'الوحده الرابعه',
    description: 'تعليم التحدث بطلاقه',
    img: 'assets/icons/4.jpg',
    lesson: [
      Lesson(
        title: 'الدرس الاول',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_1.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الثاني',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_2.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
    ],
  ),
  Unit(
    title: 'الوحده الخامسه',
    description: 'تعليم التحدث بطلاقه',
    img: 'assets/icons/5.jpg',
    lesson: [
      Lesson(
        title: 'الدرس الاول',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_1.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الثاني',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_2.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
    ],
  ),
  Unit(
    title: 'الوحده السادسه',
    description: 'تعليم التحدث بطلاقه',
    img: 'assets/icons/6.jpg',
    lesson: [
      Lesson(
        title: 'الدرس الاول',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_1.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
      Lesson(
        title: 'الدرس الثاني',
        description: 'D\'autres manifestations ',
        img: 'assets/images/student_img_2.jpg',
        frenchClass: FrenchClass(
          title: 'how can we use passa compose',
          description:
              'Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph1:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          paragraph2:
              ' Les tensions demeurent jeudi au Brésil où le président sortant Jair Bolsonaro a appelé la veille ses partisans à mettre fin aux derniers blocages routiers, tout en cautionnant les "manifestations légitimes" après sa défaite sur le fil face à Lula.',
          paragraph3:
              "Je vous lance un appel: débloquez les routes. Cela ne me paraît pas faire partie des manifestations légitimes\", a lancé mercredi le dirigeant d'extrême droite, dans une vidéo diffusée sur les réseaux sociaux, en référence aux barrages maintenus dans plus de la moitié des Etats, même s'ils étaient moins nombreux que mardi.",
          quizfrench: [
            QuizFrench(
              quistion: 'are you ...',
              options: [
                ['A', 'fine'],
                ['B', 'nine'],
                ['C', 'ten'],
              ],
              correctAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              correctAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              correctAnswer: 'B',
            ),
          ],
        ),
      ),
    ],
  )
];
