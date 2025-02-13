// class Book {
//   String title;
//   String author;
//   String publisher;

// }

const numDays = 7;

class DaysLeftInweek {
  int currentDay = 0;

  // 생성자
  DaysLeftInweek() {
    currentDay = DateTime.now().weekday;
  }
  // 메서드: 남은 일 수 계산
  int howManyDaysLeft() {
    return numDays - currentDay;
  }
}

void main() {
  var daysLeft = DaysLeftInweek();
  print('Days left in the week: ${daysLeft.howManyDaysLeft()}');
}
