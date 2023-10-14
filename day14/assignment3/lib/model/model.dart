import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchModel {
  String word;
  String phonetic;
  Phonetics phonetics;
  Meanings meanings;
  SearchModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
  });
}

class Phonetics{

}

class Meanings{
  
}

// [
//     {
//         "word": "pioneer",
//         "phonetic": "/ˌpaɪəˈnɪəɹ/",
//         "phonetics": [
//             {
//                 "text": "/ˌpaɪəˈnɪəɹ/",
//                 "audio": "https://api.dictionaryapi.dev/media/pronunciations/en/pioneer-us.mp3",
//                 "sourceUrl": "https://commons.wikimedia.org/w/index.php?curid=2651301",
//                 "license": {
//                     "name": "BY-SA 3.0",
//                     "url": "https://creativecommons.org/licenses/by-sa/3.0"
//                 }
//             }
//         ],
//         "meanings": [
//             {
//                 "partOfSpeech": "noun",
//                 "definitions": [
//                     {
//                         "definition": "One who goes before, as into the wilderness, preparing the way for others to follow.",
//                         "synonyms": [],
//                         "antonyms": []
//                     },
//                     {
//                         "definition": "A person or other entity who is first or among the earliest in any field of inquiry, enterprise, or progress.",
//                         "synonyms": [],
//                         "antonyms": [],
//                         "example": "Certain politicians can be considered as pioneers of reform."
//                     },
//                     {
//                         "definition": "A soldier detailed or employed to form roads, dig trenches, and make bridges, as an army advances; a sapper.",
//                         "synonyms": [],
//                         "antonyms": []
//                     },
//                     {
//                         "definition": "A member of any of several European organizations advocating abstinence from alcohol.",
//                         "synonyms": [],
//                         "antonyms": []
//                     },
//                     {
//                         "definition": "A child of 10–16 years in the former Soviet Union, in the second of the three stages in becoming a member of the Communist Party.",
//                         "synonyms": [],
//                         "antonyms": []
//                     }
//                 ],
//                 "synonyms": [],
//                 "antonyms": []
//             },
//             {
//                 "partOfSpeech": "verb",
//                 "definitions": [
//                     {
//                         "definition": "To be the first to do or achieve (something), preparing the way for others to follow.",
//                         "synonyms": [],
//                         "antonyms": [],
//                         "example": "The young doctor pioneered a new life-saving surgical technique."
//                     }
//                 ],
//                 "synonyms": [
//                     "break new ground",
//                     "push the envelope"
//                 ],
//                 "antonyms": []
//             }
//         ],
//         "license": {
//             "name": "CC BY-SA 3.0",
//             "url": "https://creativecommons.org/licenses/by-sa/3.0"
//         },
//         "sourceUrls": [
//             "https://en.wiktionary.org/wiki/pioneer"
//         ]
//     }
// ]