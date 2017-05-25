function kCalendar(id, date) {
   var kCalendar = document.getElementById(id);
   if( typeof( date ) !== 'undefined' ) {
      date = date.split('-');
      date[1] = date[1] - 1;
      date = new Date(date[0], date[1], date[2]);
   } else {
      var date = new Date();
   }
   var currentYear = date.getFullYear();
   //년도를 구함
   
   var currentMonth = date.getMonth() + 1;
   //연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
   
   var currentDate = date.getDate();
   //오늘 일자.
   
   date.setDate(1);
   var currentDay = date.getDay();
   //이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
   
   var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
   var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
   if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
      lastDate[1] = 29;
   //각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
   
   var currentLastDate = lastDate[currentMonth-1];
   var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
   //총 몇 주인지 구함.
   
   if(currentMonth != 1)
      var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
   else
      var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
   //만약 이번달이 1월이라면 1년 전 12월로 출력.
   
   if(currentMonth != 12) 
      var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
   else
      var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
   //만약 이번달이 12월이라면 1년 후 1월로 출력.

   
   if( currentMonth < 10 )
      var currentMonth = '0' + currentMonth;
   //10월 이하라면 앞에 0을 붙여준다.
	
	var calendar = '';
	var conts = '';
	calendar += '<div class="tslide mcol-12 col-12">';
	calendar += '			<a href="#" onclick="kCalendar('+id+','+prevDate+')" class="prev">prev</a>';
	calendar += '			' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<a href="#" onclick="kCalendar('+id+','+nextDate+')" class="next">next</a>';
	calendar += '		</div>';
	calendar += '		<table border="0" cellspacing="0" cellpadding="0" class="cal mcol-12 col-8">';
	calendar += '				<tr class="thead">';
	calendar += '				  <th>일</th>';
	calendar += '				  <th>월</th>';
	calendar += '				  <th>화</th>';
	calendar += '				  <th>수</th>';
	calendar += '				  <th>목</th>';
	calendar += '				  <th>금</th>';
	calendar += '				  <th>토</th>';
	calendar += '				</tr>';
	
	var dateNum = 1 - currentDay;
	
	for(var i = 0; i < week; i++) {
		calendar += '			<tr class="tbody">';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] +'"> </td>';
				continue;
			} else if(j==0|| j==6){
				calendar += '				<td class="' + dateString[j] +'">' + dateNum + '</td>';
			} else{
				calendar += '				<td class="' + dateString[j] +'" id="td_'+currentYear+'_'+currentMonth+'_'+dateNum+'"><a href="#cals" class="c_date" id="'+currentYear+'_'+currentMonth+'_'+dateNum+' cal-tab">' + dateNum + '</a></td>';
				conts += '<div class="cal-cont mcol-12 col-3 cont_'+currentYear+'_'+currentMonth+'_'+dateNum+'">내용</div>';
			}
		}
		calendar += '			</tr>';
	}
	
	calendar += '		</table>';
	kCalendar.innerHTML = calendar;
	contents(conts);

	return false;
}


