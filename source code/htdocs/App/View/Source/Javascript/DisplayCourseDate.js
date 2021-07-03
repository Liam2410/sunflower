function displayCourseDate(courseDateInput){
    let courseDate = new Date(courseDateInput);

    if(courseDate.getDay() == 0){
        document.write(" Chủ nhật, "+courseDate.getDate()+"/"+(courseDate.getMonth()+1)+"/"+courseDate.getFullYear());
    }
    else{
        document.write(" Thứ "+(courseDate.getDay()+1)+", "+courseDate.getDate()+"/"+(courseDate.getMonth()+1)+"/"+courseDate.getFullYear());
    }
}