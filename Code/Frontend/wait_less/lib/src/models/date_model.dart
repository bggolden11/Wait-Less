

class Date {
  final String month;
  final int day;
  final int year;

  Date(String date)
      : month = date.split(' ')[0],
        day = int.parse(date.split(' ')[1].split(',')[0]),
        year = int.parse(date.split(' ')[2]);

  static int monthToNum(String m){
    switch(m){
      case 'Jan': return 1; break;
      case 'Feb': return 2; break;
      case 'Mar': return 3; break;
      case 'Apr': return 4; break;
      case 'May': return 5; break;
      case 'Jun': return 6; break;
      case 'Jul': return 7; break;
      case 'Aug': return 8; break;
      case 'Sep': return 9; break;
      case 'Oct': return 10; break;
      case 'Nov': return 11; break;
      case 'Dec': return 12; break;
    }
    return 0;
  }

}