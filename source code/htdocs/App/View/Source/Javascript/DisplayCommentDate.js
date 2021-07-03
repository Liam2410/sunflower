function displayCommentDate(commentDateInput){
    let commentDate = new Date(commentDateInput);

    if(commentDate.getDay() == 0){
        document.write(" Chủ nhật, "+commentDate.getDate()+"/"+(commentDate.getMonth()+1)+"/"+commentDate.getFullYear());
    }
    else{
        document.write(" Thứ "+(commentDate.getDay()+1)+", "+commentDate.getDate()+"/"+(commentDate.getMonth()+1)+"/"+commentDate.getFullYear());
    }
}