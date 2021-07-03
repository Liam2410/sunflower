function displayNewsReleaseDate(newsReleaseDate){
    let releaseDate = new Date(newsReleaseDate);

    if(releaseDate.getDay() == 0){
        document.write(" Chủ nhật, "+releaseDate.getDate()+"/"+(releaseDate.getMonth()+1)+"/"+releaseDate.getFullYear());
    }
    else{
        document.write(" Thứ "+(releaseDate.getDay()+1)+", "+releaseDate.getDate()+"/"+(releaseDate.getMonth()+1)+"/"+releaseDate.getFullYear());
    }
}