import 'package:flutter/animation.dart';

class Unit {
  final String? title;
  final String? description;
  final List<Lesson>? lesson;
  Unit({
    this.title,
    this.lesson,
    this.description,
  });
}

class Lesson {
  final String? title;
  final String? description;
  final FrenchClass? frenchClass;

  Lesson({
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
  final List<QuizFrench>? quizfrench;
  FrenchClass({
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
  final String trueAnswer;
  bool? isCorrectAnswer;
  int? chosenAnswer;
  Color? statsColor;
  QuizFrench({
    this.statsColor,
    required this.quistion,
    required this.options,
    required this.trueAnswer,
    this.isCorrectAnswer,
    this.chosenAnswer,
  });
}

List<Unit> units = [
  Unit(
    title: 'unit 1',
    description:
        'fin aux derniers blocages routiers, tout en cautionnant les "ma',
    lesson: [
      Lesson(
        title: 'lesson 1',
        description: 'D\'autres manifestations ',
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
              trueAnswer: 'A',
            ),
            QuizFrench(
              quistion: 'where are you ...',
              options: [
                ['A', 'doing'],
                ['B', 'doin\'t'],
                ['C', 'going'],
              ],
              trueAnswer: 'C',
            ),
            QuizFrench(
              quistion: 'can you .... this car ?',
              options: [
                ['A', 'swim'],
                ['B', 'drive'],
                ['C', 'run'],
              ],
              trueAnswer: 'B',
            ),
          ],
        ),
      ),
    ],
  )
];
