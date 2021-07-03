function displayRegisterDate(registerDateInput){
    let registerDate = new Date(registerDateInput);
    
    document.write(registerDate.getDate()+"/"+(registerDate.getMonth()+1)+"/"+registerDate.getFullYear());
}