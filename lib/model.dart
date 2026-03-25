enum Category {
  housing(weight: 0.15, questionsNbr: 4),
  food(weight: 0.25, questionsNbr: 3),
  transport(weight: 0.20, questionsNbr: 5),
  goods(weight: 0.10, questionsNbr: 2),
  waste(weight: 0.15, questionsNbr: 4);

  final double weight;
  final int questionsNbr;
  const Category({required this.weight, required this.questionsNbr});
  double score(double response) => response / questionsNbr * weight;
}

class Question {
  final Category cat;
  final String question;
  final List<String> options;
  final List<double> responseMultiplier;

  Question({
    required this.cat,
    required this.question,
    required this.options,
    required this.responseMultiplier,
  });
}

final List<Question> questions = [
  Question(
    cat: Category.housing,
    question: "في أي نوع من المساكن تعيش؟",
    options: [
      "منزل صغير الحجم (اقل من 100 متر مربع)",
      "منزل متوسط الحجم (بين 100 و 250 متر مربع)",
      "منزل كبير الحجم (أكثر من 250 متر مربع)",
    ],
    responseMultiplier: [0.2, 0.5, 0.9],
  ),
  Question(
    cat: Category.housing,
    question: "كم عدد الأشخاص الذين يعيشون في منزلك؟",
    options: ["1", "2", "3", "4", "5 أو أكثر"],
    responseMultiplier: [1.0, 0.7, 0.5, 0.4, 0.3],
  ),
  Question(
    cat: Category.housing,
    question: "كيف يقوم والداك بتدفئة المنزل؟",
    options: [
      "الغاز الطبيعي",
      "الكهرباء",
      "الفحم",
      "طاقة متجددة (شمسية، رياح، إلخ)",
      "الخشب",
    ],
    responseMultiplier: [0.8, 0.6, 0.9, 0.1, 1.0],
  ),
  Question(
    cat: Category.housing,
    question:
        "كم عدد الصنابير والمراحيض الموجودة في منزلك (الحمام، المطبخ، غرفة الغسيل، الخارج، إلخ)؟",
    options: [
      "أقل من 3",
      "من 3 إلى 5",
      "من 6 إلى 8",
      "من 8 إلى 10",
      "أكثر من 10",
    ],
    responseMultiplier: [0.2, 0.4, 0.6, 0.8, 1.0],
  ),
  Question(
    cat: Category.food,
    question: "كم مرة في الأسبوع تأكل اللحم أو السمك؟",
    options: ["0", "1 - 3", "4 - 6", "7 - 10", "أكثر من 10"],
    responseMultiplier: [0.0, 0.3, 0.6, 0.8, 1.0],
  ),
  Question(
    cat: Category.food,
    question:
        'كم عدد الوجبات التي يطبخها والداك أسبوعياً (بما في ذلك الوجبات التي تأخذها إلى المدرسة)؟ (تنبيه: البيتزا أو المواد المعلبة لا تُحتسب!)',
    options: ["أقل من 10", "10 - 14", "14 - 18", "أكثر من 18"],
    responseMultiplier: [1.0, 0.7, 0.4, 0.2],
  ),
  Question(
    cat: Category.food,
    question:
        'عندما يشتري والداك الطعام، هل يختارون قدر الإمكان المنتجات المحلية (التي لا تأتي من ولاية أخرى أو بلد آخر)؟',
    options: ["نعم", "لا", "أحياناً", "نادراً"],
    responseMultiplier: [0.1, 1.0, 0.3, 0.7],
  ),
  Question(
    cat: Category.goods,
    question:
        'كم عدد السلع المهمة المصنوعة من مواد جديدة (مثل: جهاز ستيريو، تلفزيون، مشغل DVD، كمبيوتر، أثاث، سيارة، أجهزة كهربائية، إلخ) التي اشتراها والداك خلال الـ 12 شهراً الماضية؟',
    options: ["0", "1 - 3", "4 - 6", "أكثر من 6"],
    responseMultiplier: [0.0, 0.4, 0.7, 1.0],
  ),
  Question(
    cat: Category.goods,
    question:
        'هل اشترى والداك سلعاً منخفضة استهلاك الطاقة خلال الـ 12 شهراً الماضية (مصابيح اقتصادية، أجهزة كهربائية اقتصادية، إلخ)؟',
    options: ["نعم", "لا"],
    responseMultiplier: [0.3, 1.0],
  ),
  Question(
    cat: Category.transport,
    question: 'إذا كان لدى والديك مركبة، فما نوعها؟)',
    options: [
      "دراجة هوائية",
      'سيارة صغيرة الحجم',
      'سيارة متوسطة الحجم',
      "سيارة كبيرة الحجم",
      "سيارة دفع رباعي",
      "شاحنة",
      'لا يوجد',
    ],
    responseMultiplier: [0.0, 0.3, 0.5, 0.7, 0.8, 1.0, 0.0],
  ),
  Question(
    cat: Category.transport,
    question: "كيف تذهب إلى المدرسة؟",
    options: [
      "بالسيارة",
      "بوسائل النقل العام (حافلة، مترو، قطار إلخ)",
      "بحافلة المدرسة",
      "مشياً على الأقدام",
      'بالدراجة أو "التروتينات"',
    ],
    responseMultiplier: [1.0, 0.4, 0.3, 0.0, 0.1],
  ),
  Question(
    cat: Category.transport,
    question:
        "كم مرة في الأسبوع تستخدم وسائل النقل العام بدلاً من أن يوصلك والداك؟",
    options: [
      "0",
      "1 - 5",
      "6 - 10",
      "11 - 15",
      "أكثر من 15 ",
      "لا أستخدم أي منهما!",
    ],
    responseMultiplier: [1.0, 0.6, 0.4, 0.2, 0.1, 0.0],
  ),
  Question(
    cat: Category.transport,
    question: "أين قضيت عطلتك هذا العام؟",
    options: ["لم آخذ عطلة", "في منطقتي", "داخل تونس", "خارج تونس"],
    responseMultiplier: [0.0, 0.2, 0.4, 0.8],
  ),
  Question(
    cat: Category.transport,
    question:
        "خلال الصيف، كم مرة تذهب بالسيارة مع والديك في رحلة قصيرة لنهاية الأسبوع؟",
    options: ["0", "1 - 3", "4 - 6", "7 - 9", "أكثر من 9"],
    responseMultiplier: [0.0, 0.4, 0.6, 0.8, 1.0],
  ),
  Question(
    cat: Category.waste,
    question:
        'هل تحاول عائلتك تقليل كمية النفايات التي تنتجها (مثلاً: شراء الأطعمة بالجملة ، رفض الإعلانات الورقية، استخدام أوعية قابلة لإعادة الاستخدام ومنظفات منزلية طبيعية)؟',
    options: ["دائماً", "أحياناً", "نادراً", "أبداً"],
    responseMultiplier: [0.1, 0.5, 0.8, 1.0],
  ),
  Question(
    cat: Category.waste,
    question:
        "كم عدد أكياس القمامة كبيرة الحجم التي تضعونها في الخارج كل أسبوع؟",
    options: ["0", "كيس واحد نصف ممتلئ", "1", "2", "أكثر من 2"],
    responseMultiplier: [0.0, 0.3, 0.5, 0.8, 1.0],
  ),
  Question(
    cat: Category.waste,
    question:
        "هل تقوم عائلتك بإعادة تدوير الصحف، الكرتون، الورق، العلب المعدنية، الزجاجات البلاستيكية أو الزجاجية والمواد الأخرى؟",
    options: ["دائماً", "أحياناً", "نادراً", "أبداً"],
    responseMultiplier: [0.2, 0.6, 0.8, 1.0],
  ),
  Question(
    cat: Category.waste,
    question:
        'هل تقوم عائلتك بالتسميد العضوي (تحويل النفايات العضوية إلى سماد)؟',
    options: ["دائماً", "أحياناً", "نادراً", "أبداً"],
    responseMultiplier: [0.1, 0.5, 0.8, 1.0],
  ),
];
