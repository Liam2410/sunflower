function displayRatingPointToStar(ratingPoint){
    ratingValue = parseFloat(ratingPoint);
    ratingStar = Math.floor(ratingValue);
    ratingHalfStar = ratingValue - ratingStar;

    for(i = 0; i < ratingStar; i++){
        document.write(`<span class="text-warning"><i class="fa fa-star " aria-hidden="true"></i></span>`);
    }
    if(ratingHalfStar >= 0.5){
        document.write(`<span class="text-warning"><i class="fa fa-star-half-o" aria-hidden="true"></i></span>`);
    }
    for(i = 0; i < 5 - (ratingStar + Math.round(ratingHalfStar)); i++){
        document.write(`<span class="text-warning"><i class="fa fa-star-o" aria-hidden="true"></i></span>`);
    }
}