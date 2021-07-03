function displayNormalDate(normalDate){
    let date = new Date(normalDate);

    return (date.getDate()+"/"+(date.getMonth()+1)+"/"+date.getFullYear());
}


function displayExpiredStatus(regiterDate, startDateCourse){
    document.write(`
    <button class="btn btn-danger rounded-circle" data-toggle="popover" data-placement="top" title="Đã hết hạn"
    data-content="Ngày đăng ký: `+ displayNormalDate(regiterDate) +"; ngày bắt đầu khóa học: "+displayNormalDate(startDateCourse)+`">
        <span class="material-icons" style="font-size: small;">
            hourglass_disabled
            </span>
    </button>`
    )
}

function displayUnderPendingStatus(regiterDate, startDateCourse){
    document.write(`
    <button class="btn btn-success rounded-circle" data-toggle="popover" data-placement="top" title="Còn hạn"
    data-content="Ngày đăng ký: `+ displayNormalDate(regiterDate) +"; ngày bắt đầu khóa học: "+displayNormalDate(startDateCourse)+`">
        <span class="material-icons" style="font-size: small;">
            hourglass_top
            </span>
    </button>`
    )
}