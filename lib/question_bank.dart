import 'package:flutter_application_1/question.dart';
import 'dart:math';
import 'package:flutter_application_1/user_performance.dart';

class QuestionBank {
  static final List<Question> _allQuestions = [

    // Question 1: Capital of Australia
    Question(
      question: "What is the capital of Australia?",
      options: ["Sydney", "Canberra", "Melbourne", "Brisbane"],
      correctAnswer: "Canberra",
      type: QuestionType.multipleChoice,
      id: "australia_capital",
    ),

    Question(
      question: "What is the capital city of Australia?",
      options: [],
      correctAnswer: "Canberra",
      type: QuestionType.openEnded,
      id: "australia_capital",
    ),

    Question(
      question: "What is the capital of Australia?",
      options: ["Sydney", "Canberra", "Melbourne", "Brisbane"],
      correctAnswer: "Canberra",
      type: QuestionType.visualQuestion,
      id: "australia_capital",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/capitals/canberra.png.jpg",
    ),

    // Question 2: Capital of France
    Question(
      question: "What is the capital of France?",
      options: ["Paris", "London", "Berlin", "Madrid"],
      correctAnswer: "Paris",
      type: QuestionType.multipleChoice,
      id: "france_capital",
    ),

    Question(
      question: "What is the capital of France?",
      options: [],
      correctAnswer: "Paris",
      type: QuestionType.openEnded,
      id: "france_capital",
    ),

    Question(
      question: "What is the capital of France?",
      options: ["Paris", "London", "Rome", "Berlin"],
      correctAnswer: "Paris",
      type: QuestionType.visualQuestion,
      id: "france_capital",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/capitals/paris.jpg",
    ),

    // Question 3: Capital of Rwanda
    Question(
      question: "What is the capital of Rwanda?",
      options: ["Gitega", "Kinsaha", "Kigali", "Dakar"],
      correctAnswer: "Kigali", // Fixed correct answer
      type: QuestionType.multipleChoice,
      id: "rwanda_capital",
    ),

    Question(
      question: "What is the capital of Rwanda?",
      options: [],
      correctAnswer: "Kigali",
      type: QuestionType.openEnded,
      id: "rwanda_capital",
    ),

    Question(
      question: "What is the capital of Rwanda?",
      options: ["Gitega", "Kinsaha", "Kigali", "Dakar"],
      correctAnswer: "Kigali",
      type: QuestionType.visualQuestion,
      id: "rwanda_capital",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/capitals/rwanda_capital.png",
    ),

    // Question 4: Capital of Turkmenistan
    Question(
      question: "What is the capital of Turkmenistan?",
      options: ["Ashgabat", "Dushanbe", "Tashkent", "Bishkek"],
      correctAnswer: "Ashgabat",
      type: QuestionType.multipleChoice,
      id: "turkmenistan_capital",
    ),

    Question(
      question: "What is the capital city of Turkmenistan?",
      options: [],
      correctAnswer: "Ashgabat",
      type: QuestionType.openEnded,
      id: "turkmenistan_capital",
    ),

    Question(
      question: "What is the capital of Turkmenistan?",
      options: ["Ashgabat", "Dushanbe", "Tashkent", "Bishkek"],
      correctAnswer: "Ashgabat",
      type: QuestionType.visualQuestion,
      id: "turkmenistan_capital",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/capitals/ashgabat.jpg",
    ),

    // Question 5: Capital of Syria
    Question(
      question: "What is the capital of Syria?",
      options: ["Damascus", "Aleppo", "Beirut", "Amman"],
      correctAnswer: "Damascus",
      type: QuestionType.multipleChoice,
      id: "syria_capital",
    ),

    Question(
      question: "What is the capital city of Syria?",
      options: [],
      correctAnswer: "Damascus",
      type: QuestionType.openEnded,
      id: "syria_capital",
    ),

    Question(
      question: "What is the capital of Syria?",
      options: ["Damascus", "Aleppo", "Beirut", "Amman"],
      correctAnswer: "Damascus",
      type: QuestionType.visualQuestion,
      id: "syria_capital",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/capitals/damascus.png",
    ),

    // Question 6: Flag of Canada
    Question(
      question: "What country has a maple leaf on its flag??",
      options: ["USA", "UK", "Canada", "Mexico"],
      correctAnswer: "Canada",
      type: QuestionType.multipleChoice,
      id: "canada_flag",
    ),

    Question(
      question: "What country has a maple leaf on its flag?",
      options: [],
      correctAnswer: "Canada",
      type: QuestionType.openEnded,
      id: "canada_flag",
    ),

    Question(
      question: "Which country does this flag belong to?",
      options: ["Canada", "USA", "Australia", "United Kingdom"],
      correctAnswer: "Canada",
      type: QuestionType.visualQuestion,
      id: "canada_flag",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/flags/canada_flag.png.jpg",
    ),

    // Question 7: Flag of Japan 
    Question(
      question: "What country has a red dot on a white background on its flag?",
      options: ["China", "Japan", "North Korea", "South Korea"],
      correctAnswer: "Japan", // Fixed correct answer
      type: QuestionType.multipleChoice,
      id: "japan_flag",
    ),

    Question(
      question: "What country has a red dot on a white background on its flag?",
      options: [],
      correctAnswer: "Japan",
      type: QuestionType.openEnded,
      id: "japan_flag", // Fixed ID
    ),

    Question(
      question: "Which country does this flag belong to?",
      options: ["Japan", "China", "South Korea", "Vietnam"],
      correctAnswer: "Japan",
      type: QuestionType.visualQuestion,
      id: "japan_flag",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/flags/japan_flag.png",
    ),

    // Question 8: Flag of Brazil 
    Question(
      question: "What South American's country flag is green, yellow and blue?",
      options: ["Colombia", "Bolivia", "Suriname", "Brazil"],
      correctAnswer: "Brazil", // Fixed correct answer
      type: QuestionType.multipleChoice,
      id: "brazil_flag",
    ),

    Question(
      question: "What South American's country flag is green, yellow and blue?",
      options: [],
      correctAnswer: "Brazil",
      type: QuestionType.openEnded,
      id: "brazil_flag",
    ),

    Question(
      question: "Which country does this flag belong to?",
      options: ["Colombia", "Bolivia", "Suriname", "Brazil"],
      correctAnswer: "Brazil",
      type: QuestionType.visualQuestion,
      id: "brazil_flag",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/flags/brazil_flag.png",
    ),

    // Question 9: Flag of Luxembourg
    Question(
      question: "Which country's flag has horizontal bands of red, white, and light blue?",
      options: ["Netherlands", "Luxembourg", "Thailand", "Russia"],
      correctAnswer: "Luxembourg",
      type: QuestionType.multipleChoice,
      id: "luxembourg_flag",
    ),

    Question(
      question: "Which European country has a flag with horizontal red, white, and light blue bands?",
      options: [],
      correctAnswer: "Luxembourg",
      type: QuestionType.openEnded,
      id: "luxembourg_flag",
    ),

    Question(
      question: "Which country does this flag belong to?",
      options: ["Netherlands", "Luxembourg", "Paraguay", "Russia"],
      correctAnswer: "Luxembourg",
      type: QuestionType.visualQuestion,
      id: "luxembourg_flag",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/flags/luxembour_flag.png",
    ),

    // Question 10: Flag of Saudi Arabia
    Question(
      question: "Which country's flag has a green background with a white sword and Arabic inscription?",
      options: ["Pakistan", "Saudi Arabia", "Iran", "Algeria"],
      correctAnswer: "Saudi Arabia",
      type: QuestionType.multipleChoice,
      id: "saudi_arabia_flag",
    ),

    Question(
      question: "Which country has a green flag with a white sword and Arabic inscription?",
      options: [],
      correctAnswer: "Saudi Arabia",
      type: QuestionType.openEnded,
      id: "saudi_arabia_flag",
    ),

    Question(
      question: "Which country does this flag belong to?",
      options: ["Pakistan", "Saudi Arabia", "Iran", "Algeria"],
      correctAnswer: "Saudi Arabia",
      type: QuestionType.visualQuestion,
      id: "saudi_arabia_flag",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/flags/saudi_arabia_flag.png",
    ),

    // Question 11: Location of Japan
    Question(
      question: "Where is Japan located?",
      options: ["East Asia", "Central Asia", "West Asia", "Africa"],
      correctAnswer: "East Asia",
      type: QuestionType.multipleChoice,
      id: "japan_location",
    ),

    Question(
      question: "On which continent is Japan located?",
      options: [],
      correctAnswer: "Asia",
      type: QuestionType.openEnded,
      id: "japan_location",
    ),

    Question(
      question: "Which country is highlighted on this map?",
      options: ["Japan", "China", "South Korea", "Philippines"],
      correctAnswer: "Japan",
      type: QuestionType.visualQuestion,
      id: "japan_location",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/japan_map.png",
    ),

    // Question 12: Location of Australia 
    Question(
      question: "Which continent is Australia in?",
      options: ["Europe", "Asia", "Australia", "Africa"],
      correctAnswer: "Australia",
      type: QuestionType.multipleChoice,
      id: "australia_continent",
    ),

    Question(
      question: "What continent is Australia in?",
      options: [],
      correctAnswer: "Australia", 
      type: QuestionType.openEnded,
      id: "australia_continent",
    ),

    Question(
      question: "Which continent is highlighted on this map?",
      options: ["Australia", "Asia", "Africa", "South America"],
      correctAnswer: "Australia",
      type: QuestionType.visualQuestion,
      id: "australia_continent",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/oceania_map.png",
    ),

    // Question 13: Location of Cameroon
    Question(
      question: "In which region of Africa is Cameroon located?",
      options: ["Central Africa", "East Africa", "West Africa", "Southern Africa"],
      correctAnswer: "Central Africa",
      type: QuestionType.multipleChoice,
      id: "cameroon_location",
    ),

    Question(
      question: "In which region of Africa is Cameroon located?",
      options: [],
      correctAnswer: "Central Africa",
      type: QuestionType.openEnded,
      id: "cameroon_location",
    ),

    Question(
      question: "Which country is highlighted on this map?",
      options: ["Nigeria", "Cameroon", "Chad", "Congo"],
      correctAnswer: "Cameroon",
      type: QuestionType.visualQuestion,
      id: "cameroon_location",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/cameroon_map.png.jpg",
    ),

    // Question 14: Location of Guatemala
    Question(
      question: "In which region is Guatemala located?",
      options: ["Central America", "South America", "Caribbean", "North America"],
      correctAnswer: "Central America",
      type: QuestionType.multipleChoice,
      id: "guatemala_location",
    ),

    Question(
      question: "In which part of the Americas is Guatemala located?",
      options: [],
      correctAnswer: "Central America",
      type: QuestionType.openEnded,
      id: "guatemala_location",
    ),

    Question(
      question: "Which country is highlighted on this map?",
      options: ["Mexico", "Honduras", "Guatemala", "El Salvador"],
      correctAnswer: "Guatemala",
      type: QuestionType.visualQuestion,
      id: "guatemala_location",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/guatemala_map.png",
    ),

    // Question 15: Location of Afghanistan
    Question(
      question: "In which region is Afghanistan located?",
      options: ["Central Asia", "South Asia", "Middle East", "East Asia"],
      correctAnswer: "Central Asia",
      type: QuestionType.multipleChoice,
      id: "afghanistan_location",
    ),

    Question(
      question: "In which region is Afghanistan located?",
      options: [],
      correctAnswer: "Central Asia",
      type: QuestionType.openEnded,
      id: "afghanistan_location",
    ),

    Question(
      question: "Which country is highlighted on this map?",
      options: ["Pakistan", "Iran", "Afghanistan", "Tajikistan"],
      correctAnswer: "Afghanistan",
      type: QuestionType.visualQuestion,
      id: "afghanistan_location",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/afghanistan_map.png.jpg",
    ),

    // Question 16: Biggest dessert record
    Question(
      question: "Which is the largest hot desert in the world?",
      options: ["Sahara Desert", "Arabian Desert", "Kalahari Desert", "Gobi Desert"],
      correctAnswer: "Sahara Desert",
      type: QuestionType.multipleChoice,
      id: "largest_desert",
    ),
    Question(
      question: "What is the largest hot desert in the world?",
      options: [],
      correctAnswer: "Sahara Desert",
      type: QuestionType.openEnded,
      id: "largest_desert",
    ),
    Question(
      question: "What is the largest hot desert in the world?",
      options: ["Sahara Desert", "Arabian Desert", "Atacama Desert", "Gobi Desert"],
      correctAnswer: "Sahara Desert",
      type: QuestionType.visualQuestion,
      id: "largest_desert",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/sahara_desert.png.jpg",
    ),

    // Question 17: Most populous city 
    Question(
      question: "What is the most populous metropolitan area in the world?",
      options: ["Tokyo", "Delhi", "Shanghai", "São Paulo"],
      correctAnswer: "Tokyo",
      type: QuestionType.multipleChoice,
      id: "most_populous_city",
    ),
    Question(
      question: "What the most populous city in the world?",
      options: [],
      correctAnswer: "Tokyo",
      type: QuestionType.openEnded,
      id: "most_populous_city",
    ),
    Question(
      question: "What is the most populous metropolitan area in the world?",
      options: ["Tokyo", "New York City", "Shanghai", "Mexico City"],
      correctAnswer: "Tokyo",
      type: QuestionType.visualQuestion,
      id: "most_populous_city",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/capitals/tokyo.png.jpg",
    ),

    // Question 18: Smallest city 
    Question(
      question: "What is the smallest country in the world by land area?",
      options: ["Vatican City", "Monaco", "Nauru", "Tuvalu"],
      correctAnswer: "Vatican City",
      type: QuestionType.multipleChoice,
      id: "smallest_country",
    ),
    Question(
      question: "Name the smallest country in the world:",
      options: [],
      correctAnswer: "Vatican City",
      type: QuestionType.openEnded,
      id: "smallest_country",
    ),
    Question(
      question: "What is the smallest country in the world?",
      options: ["Vatican City", "Monaco", "San Marino", "Liechtenstein"],
      correctAnswer: "Vatican City",
      type: QuestionType.visualQuestion,
      id: "smallest_country",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/capitals/vatican.png.jpeg",
    ),

    // Question 19: Largest lake
    Question(
      question: "What is the deepest lake in the world?",
      options: ["Lake Baikal", "Caspian Sea", "Lake Superior", "Lake Tanganyika"],
      correctAnswer: "Lake Baikal",
      type: QuestionType.multipleChoice,
      id: "largest_lake",
    ),
    Question(
      question: "Name the deepest lake in the world:",
      options: [],
      correctAnswer: "Lake Baikal",
      type: QuestionType.openEnded,
      id: "largest_lake",
    ),
    Question(
      question: "What is the deepest lake in the world?",
      options: ["Lake Baikal", "Great Bear Lake", "Lake Victoria", "Lake Michigan"],
      correctAnswer: "Lake Baikal",
      type: QuestionType.visualQuestion,
      id: "largest_lake",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/lake_baikal.png",
    ),

    // Question 20: Deepest point 
    Question(
      question: "What is the deepest point in the Earth's oceans?",
      options: ["Mariana Trench", "Tonga Trench", "Philippine Trench", "Java Trench"],
      correctAnswer: "Mariana Trench",
      type: QuestionType.multipleChoice,
      id: "deepest_ocean",
    ),
    Question(
      question: "Name the deepest known part of the world's oceans:",
      options: [],
      correctAnswer: "Mariana Trench",
      type: QuestionType.openEnded,
      id: "deepest_ocean",
    ),
    Question(
      question: "What is the deepest point in the Earth's oceans?",
      options: ["Mariana Trench", "Great Barrier Reef", "Mid-Atlantic Ridge", "Gulf Stream"],
      correctAnswer: "Mariana Trench",
      type: QuestionType.visualQuestion,
      id: "deepest_ocean",
      imageAsset: "/Users/misia/Desktop/geography_app/flutter_application_1/assets/assets/images/maps/mariana_trench.png.jpg",
    ),

  ];

  // Get questions filtered by previously correct answers
  static List<Question> getFilteredQuestions(int count, Set<String> previouslyCorrect) {
    // Print some debug info
    print("Previous correct IDs: $previouslyCorrect");
    
    // Filter out questions that have been answered correctly by ID
    List<Question> available = _allQuestions.where((q) => !previouslyCorrect.contains(q.id)).toList();
    
    // Print available questions
    print("Available questions: ${available.length}");
    print("Available question types: ${available.map((q) => q.type).toSet()}");
    
    // Group questions by their ID
    Map<String, List<Question>> questionGroups = {};
    for (var question in available) {
      if (!questionGroups.containsKey(question.id)) {
        questionGroups[question.id] = [];
      }
      questionGroups[question.id]!.add(question);
    }
    
    // Pick one random version (MC, open, or visual) for each unique question
    List<Question> selectedQuestions = [];
    var random = Random();
    
    // Print groups for debugging
    questionGroups.forEach((id, questions) {
      print("Question ID: $id has ${questions.length} variations with types: ${questions.map((q) => q.type).toList()}");
    });
    
    // Convert map to list of unique IDs
    List<String> uniqueIds = questionGroups.keys.toList();
    uniqueIds.shuffle();
    
    // Take up to 'count' unique questions
    for (int i = 0; i < min(count, uniqueIds.length); i++) {
      String id = uniqueIds[i];
      List<Question> variations = questionGroups[id]!;
      
      // Randomly decide which version to use
      int randomIndex = random.nextInt(variations.length);
      Question selectedQuestion = variations[randomIndex];
      
      // Print which type was selected for debugging
      print("Selected question: $id, type: ${selectedQuestion.type}");
      
      selectedQuestions.add(selectedQuestion);
    }
    
    return selectedQuestions;
  }

  static List<Question> getPersonalizedQuestions(
      int count, 
      Set<String> previouslyCorrect, 
      UserPerformance performance) {
    
    // Filter out questions that have been answered correctly
    List<Question> available = _allQuestions.where((q) => !previouslyCorrect.contains(q.id)).toList();
    
    // Group questions by their ID
    Map<String, List<Question>> questionGroups = {};
    for (var question in available) {
      if (!questionGroups.containsKey(question.id)) {
        questionGroups[question.id] = [];
      }
      questionGroups[question.id]!.add(question);
    }
    
    // Get type selection weights from performance
    Map<String, double> typeWeights = performance.typeSelectionWeights;
    
    // Convert map to list of unique IDs
    List<String> uniqueIds = questionGroups.keys.toList();
    uniqueIds.shuffle();
    
    List<Question> selectedQuestions = [];
    var random = Random();
    
    // Take up to 'count' unique questions
    for (int i = 0; i < min(count, uniqueIds.length); i++) {
      String id = uniqueIds[i];
      List<Question> variations = questionGroups[id]!;
      
      // Group variations by type
      Map<String, List<Question>> typeGroups = {};
      for (var q in variations) {
        String type = q.type.toString().split('.').last;
        if (!typeGroups.containsKey(type)) {
          typeGroups[type] = [];
        }
        typeGroups[type]!.add(q);
      }
      
      // Select question type based on performance weights
      String selectedType = _selectWeightedType(typeGroups.keys.toList(), typeWeights);
      
      // If selected type isn't available for this question, choose randomly
      if (!typeGroups.containsKey(selectedType) || typeGroups[selectedType]!.isEmpty) {
        List<String> availableTypes = typeGroups.keys.toList();
        selectedType = availableTypes[random.nextInt(availableTypes.length)];
      }
      
      // Pick random question of the selected type
      int randomIndex = random.nextInt(typeGroups[selectedType]!.length);
      Question selectedQuestion = typeGroups[selectedType]![randomIndex];
      
      selectedQuestions.add(selectedQuestion);
    }
    
    return selectedQuestions;
  }

  // Helper method to select a type based on weighted probabilities
  static String _selectWeightedType(List<String> types, Map<String, double> weights) {
    // If we have no weights yet, choose randomly
    if (weights.isEmpty) {
      return types[Random().nextInt(types.length)];
    }
    
    double randomValue = Random().nextDouble();
    double cumulativeProbability = 0.0;
    
    for (String type in types) {
      // Use weight if available, otherwise equal probability
      double weight = weights[type] ?? (1.0 / types.length);
      cumulativeProbability += weight;
      
      if (randomValue <= cumulativeProbability) {
        return type;
      }
    }
    
    // Fallback to the last type (shouldn't happen with proper weights)
    return types.last;
  }
}
