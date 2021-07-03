function displayMoneyCurrency(moneyValue) {
    moneyValue = moneyValue.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
    document.write(moneyValue);
}