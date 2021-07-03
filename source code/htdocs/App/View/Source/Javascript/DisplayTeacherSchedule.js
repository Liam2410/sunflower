function getFirstDayOfWeek(date){
    while(!date.toDateString().includes('Mon')){
        date.setDate(date.getDate() - 1);
    }
    return date
}

function getLastDayOfWeek(date){
    while(!date.toDateString().includes('Sun')){
        date.setDate(date.getDate() + 1);
    }
    return date
}

function displayWeekSchedule(aDay){
    var schedule = [];
    var days = [];

    var firstDateWeek = getFirstDayOfWeek(new Date(aDay.getFullYear(), aDay.getMonth(), aDay.getDate()));
    var lastDateWeek = getLastDayOfWeek(new Date(aDay.getFullYear(), aDay.getMonth(), aDay.getDate()));

    schedule.push({"MondayMorning": firstDateWeek});
    schedule.push({"MondayEvening": firstDateWeek});
    schedule.push({"MondayNight": firstDateWeek});

    days.push(firstDateWeek);

    nextDay = new Date(firstDateWeek.toDateString());
    nextDay.setDate(nextDay.getDate() + 1);

    schedule.push({"TuesdayMorning": nextDay});
    schedule.push({"TuesdayEvening": nextDay});
    schedule.push({"TuesdayNight": nextDay});

    days.push(nextDay);

    nextDay = new Date(firstDateWeek.toDateString());
    nextDay.setDate(firstDateWeek.getDate() + 2);

    schedule.push({"WednesdayMorning": nextDay});
    schedule.push({"WednesdayEvening": nextDay});
    schedule.push({"WednesdayNight": nextDay});

    days.push(nextDay);

    nextDay = new Date(firstDateWeek.toDateString());
    nextDay.setDate(firstDateWeek.getDate() + 3);

    schedule.push({"ThursdayMorning": nextDay});
    schedule.push({"ThursdayEvening": nextDay});
    schedule.push({"ThursdayNight": nextDay});

    days.push(nextDay);

    nextDay = new Date(firstDateWeek.toDateString());
    nextDay.setDate(firstDateWeek.getDate() + 4);

    schedule.push({"FirdayMorning": nextDay});
    schedule.push({"FirdayEvening": nextDay});
    schedule.push({"FirdayNight": nextDay});

    days.push(nextDay);

    nextDay = new Date(firstDateWeek.toDateString());
    nextDay.setDate(firstDateWeek.getDate() + 5);

    schedule.push({"SaturdayMorning": nextDay});
    schedule.push({"SaturdayEvening": nextDay});
    schedule.push({"SaturdayNight": nextDay});

    days.push(nextDay);

    schedule.push({"SundayMorning": lastDateWeek});
    schedule.push({"SundayEvening": lastDateWeek});
    schedule.push({"SundayNight": lastDateWeek});

    days.push(lastDateWeek);

    var courseData = [];

    var classArray = document.getElementsByClassName("courseTimeData");
    for (let index = 0; index < classArray.length; index++) {
        let element = classArray[index];
        element = element.innerHTML.toString().split(".");
        courseData.push({"Name": element[0], "Time": element[1], "StartDate": element[2], "EndDate": element[3]});
    }

    for (let index = 0; index < courseData.length; index++) {
        let element = courseData[index];
        let startDateOfCourse = new Date(element.StartDate);
        let endDateOfCourse = new Date(element.EndDate);
        let nameOfCourse = element.Name;
        let timeCourse = element.Time;

        if(timeCourse.trim() == "Sáng T2, T4, T6"){
            if (schedule[0].MondayMorning >= startDateOfCourse && schedule[0].MondayMorning <= endDateOfCourse){
                schedule[0] = {"MondayMorning": nameOfCourse};
            }
            if (schedule[6].WednesdayMorning >= startDateOfCourse && schedule[6].WednesdayMorning <= endDateOfCourse){
                schedule[6] = {"WednesdayMorning": nameOfCourse};
            }
            if (schedule[12].FirdayMorning >= startDateOfCourse && schedule[12].FirdayMorning <= endDateOfCourse){
                schedule[12] = {"FirdayMorning": nameOfCourse};
            }
        }
        else if(timeCourse.trim() == "Chiều T2, T4, T6"){
            if (schedule[1].MondayEvening >= startDateOfCourse && schedule[1].MondayEvening <= endDateOfCourse){
                schedule[1] = {"MondayEvening": nameOfCourse};
            }
            if (schedule[7].WednesdayEvening >= startDateOfCourse && schedule[7].WednesdayEvening <= endDateOfCourse){
                schedule[7] = {"WednesdayEvening": nameOfCourse};
            }
            if (schedule[13].FirdayEvening >= startDateOfCourse && schedule[13].FirdayEvening <= endDateOfCourse){
                schedule[13] = {"FirdayEvening": nameOfCourse};
            }
        }
        else if(timeCourse.trim() == "Tối T2, T4, T6"){
            if (schedule[2].MondayNight >= startDateOfCourse && schedule[2].MondayNight <= endDateOfCourse){
                schedule[2] = {"MondayNight": nameOfCourse};
            }
            if (schedule[8].WednesdayNight >= startDateOfCourse && schedule[8].WednesdayNight <= endDateOfCourse){
                schedule[8] = {"WednesdayNight": nameOfCourse};
            }
            if (schedule[14].FirdayNight >= startDateOfCourse && schedule[14].FirdayNight <= endDateOfCourse){
                schedule[14] = {"FirdayNight": nameOfCourse};
            }
        }
        else if(timeCourse.trim() == "Sáng T3, T5, T7"){
            if (schedule[3].TuesdayMorning >= startDateOfCourse && schedule[3].TuesdayMorning <= endDateOfCourse){
                schedule[3] = {"TuesdayMorning": nameOfCourse};
            }
            if (schedule[9].ThursdayMorning >= startDateOfCourse && schedule[9].ThursdayMorning <= endDateOfCourse){
                schedule[9] = {"ThursdayMorning": nameOfCourse};
            }
            if (schedule[15].SaturdayMorning >= startDateOfCourse && schedule[15].SaturdayMorning <= endDateOfCourse){
                schedule[15] = {"SaturdayMorning": nameOfCourse};
            }
        }
        else if(timeCourse.trim() == "Chiều T3, T5, T7"){
            if (schedule[4].TuesdayEvening >= startDateOfCourse && schedule[4].TuesdayEvening <= endDateOfCourse){
                schedule[4] = {"TuesdayEvening": nameOfCourse};
            }
            if (schedule[10].ThursdayEvening >= startDateOfCourse && schedule[10].ThursdayEvening <= endDateOfCourse){
                schedule[10] = {"ThursdayEvening": nameOfCourse};
            }
            if (schedule[16].SaturdayEvening >= startDateOfCourse && schedule[16].SaturdayEvening <= endDateOfCourse){
                schedule[16] = {"SaturdayEvening": nameOfCourse};
            }
        }
        else{
            if (schedule[5].TuesdayNight >= startDateOfCourse && schedule[5].TuesdayNight <= endDateOfCourse){
                schedule[5] = {"TuesdayNight": nameOfCourse};
            }
            if (schedule[11].ThursdayNight >= startDateOfCourse && schedule[11].ThursdayNight <= endDateOfCourse){
                schedule[11] = {"ThursdayNight": nameOfCourse};
            }
            if (schedule[17].SaturdayNight >= startDateOfCourse && schedule[17].SaturdayNight <= endDateOfCourse){
                schedule[17] = {"SaturdayNight": nameOfCourse};
            }
        }
    }

    return(
        `<table class="table table-bordered schedule-table">
            <thead class="thead-dark">
                <tr>
                    <th>Thứ<br>Ca</th>
                    <th>Thứ 2<br>` + days[0].getDate() + "/" + (days[0].getMonth() == 0 ? 12 : (days[0].getMonth() + 1)) + `<br></th>
                    <th>Thứ 3<br>`+ days[1].getDate() + "/" + (days[1].getMonth() == 0 ? 12 : (days[1].getMonth() + 1)) +`</th>
                    <th>Thứ 4<br>`+ days[2].getDate() + "/" + (days[1].getMonth() == 0 ? 12 : (days[2].getMonth() + 1)) +`</th>
                    <th>Thứ 5<br>`+ days[3].getDate() + "/" + (days[1].getMonth() == 0 ? 12 : (days[3].getMonth() + 1)) +`</th>
                    <th>Thứ 6<br>`+ days[4].getDate() + "/" + (days[1].getMonth() == 0 ? 12 : (days[4].getMonth() + 1)) +`</th>
                    <th>Thứ 7<br>`+ days[5].getDate() + "/" + (days[1].getMonth() == 0 ? 12 : (days[5].getMonth() + 1)) +`</th>
                    <th>Chủ nhật<br>`+ days[6].getDate() + "/" + (days[1].getMonth() == 0 ? 12 : (days[6].getMonth() + 1)) +`</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Sáng<br>(8:30-11:30)</th>
                    <td>`+(typeof(schedule[0].MondayMorning) != "object" ?  schedule[0].MondayMorning : "")+`</td>
                    <td>`+(typeof(schedule[3].TuesdayMorning) != "object" ?  schedule[3].TuesdayMorning : "")+`</td>
                    <td>`+(typeof(schedule[6].WednesdayMorning) != "object" ?  schedule[6].WednesdayMorning : "")+`</td>
                    <td>`+(typeof(schedule[9].ThursdayMorning) != "object" ?  schedule[9].ThursdayMorning : "")+`</td>
                    <td>`+(typeof(schedule[12].FirdayMorning) != "object" ?  schedule[12].FirdayMorning : "")+`</td>
                    <td>`+(typeof(schedule[15].SaturdayMorning) != "object" ?  schedule[15].SaturdayMorning : "")+`</td>
                    <td>`+(typeof(schedule[18].SundayMorning) != "object" ?  schedule[18].SundayMorning : "")+`</td>
                </tr>
                <tr>
                    <th>Chiều<br>(14:00-17:00)</th>
                    <td>`+(typeof(schedule[1].MondayEvening) != "object" ?  schedule[1].MondayEvening : "")+`</td>
                    <td>`+(typeof(schedule[4].TuesdayEvening) != "object" ?  schedule[4].TuesdayEvening : "")+`</td>
                    <td>`+(typeof(schedule[7].WednesdayEvening) != "object" ?  schedule[7].WednesdayEvening : "")+`</td>
                    <td>`+(typeof(schedule[10].ThursdayEvening) != "object" ?  schedule[10].ThursdayEvening : "")+`</td>
                    <td>`+(typeof(schedule[13].FirdayEvening) != "object" ?  schedule[13].FirdayEvening : "")+`</td>
                    <td>`+(typeof(schedule[16].SaturdayEvening) != "object" ?  schedule[16].SaturdayEvening : "")+`</td>
                    <td>`+(typeof(schedule[19].SundayEvening) != "object" ?  schedule[19].SundayEvening : "")+`</td>
                </tr>
                <tr>
                    <th>Tối<br>(18:00-21:00)</th>
                    <td>`+(typeof(schedule[2].MondayNight) != "object" ?  schedule[2].MondayNight : "")+`</td>
                    <td>`+(typeof(schedule[5].TuesdayNight) != "object" ?  schedule[5].TuesdayNight : "")+`</td>
                    <td>`+(typeof(schedule[8].WednesdayNight) != "object" ?  schedule[8].WednesdayNight : "")+`</td>
                    <td>`+(typeof(schedule[11].ThursdayNight) != "object" ?  schedule[11].ThursdayNight : "")+`</td>
                    <td>`+(typeof(schedule[14].FirdayNight) != "object" ?  schedule[14].FirdayNight : "")+`</td>
                    <td>`+(typeof(schedule[17].SaturdayNight) != "object" ?  schedule[17].SaturdayNight : "")+`</td>
                    <td>`+(typeof(schedule[20].SundayNight) != "object" ?  schedule[20].SundayNight : "")+`</td>
                </tr>
            </tbody>
        </table>`)
}

function getFirstLastDayOfWeek(){
    firstDate = new Date(dayInWeek);
    firstDate = getFirstDayOfWeek(firstDate);

    lastDate = new Date(dayInWeek);
    lastDate = getLastDayOfWeek(lastDate);

    firstDayOfWeek = firstDate.getDate();
    firstMonthOfWeek = firstDate.getMonth() + 1;
    firstYearOfWeek = firstDate.getFullYear();

    lastDateOfWeek = lastDate.getDate();
    lastMonthOfWeek = lastDate.getMonth() + 1;
    lastYearOfWeek = lastDate.getFullYear();
    
    timeInWeek = document.getElementById('time-in-week-btn');
    timeInWeek.innerHTML = firstDayOfWeek+"/"+firstMonthOfWeek+"/"+firstYearOfWeek+" đến "+lastDateOfWeek+"/"+lastMonthOfWeek+"/"+lastYearOfWeek;
}

function displayThisWeekSchedule(){
    scheduleTableBody = document.getElementById('schedule-table-body');
    scheduleTableBody.innerHTML = displayWeekSchedule(dayInWeek);
}

function previousWeekButton(){
    for (let i = 1; i <= 7; i++) {
        dayInWeek.setDate(dayInWeek.getDate() - 1);
    }

    scheduleTableBody = document.getElementById('schedule-table-body');
    scheduleTableBody.innerHTML = displayWeekSchedule(dayInWeek);

    getFirstLastDayOfWeek();
}

function nextWeekButton(){
    for (let i = 1; i <= 7; i++) {
        dayInWeek.setDate(dayInWeek.getDate() + 1);
    }

    scheduleTableBody = document.getElementById('schedule-table-body');
    scheduleTableBody.innerHTML = displayWeekSchedule(dayInWeek);

    getFirstLastDayOfWeek();
}

var dayInWeek = new Date();

getFirstLastDayOfWeek();

