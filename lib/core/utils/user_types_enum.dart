// enum UserType {
//   ENGINEER,
//   TECHNICAL_WORKER,
//   UNKNOWN,
// }
//
// extension UserTypeExtension on UserType {
//   String get code {
//     switch (this) {
//       case UserType.ENGINEER:
//         return 'ENGINEER';
//       case UserType.TECHNICAL_WORKER:
//         return 'TECHNICAL_WORKER';
//       default:
//         return 'UNKNOWN';
//     }
//   }
//
//   static UserType fromCode(String code) {
//     switch (code) {
//       case 'ENGINEER':
//         return UserType.ENGINEER;
//       case 'TECHNICAL_WORKER':
//         return UserType.TECHNICAL_WORKER;
//       default:
//         return UserType.UNKNOWN;
//     }
//   }
// }