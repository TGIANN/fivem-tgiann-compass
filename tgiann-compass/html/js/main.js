$(function() {
    $.post('https://tgiann-compass/uiReady');
});

window.addEventListener('message', (event) => {
    const data = event.data
    switch (data.action) {
        case "open":
            $('.compassui').fadeIn();
            break;
        case "close":
            $('.compassui').fadeOut();
            break;
        case "update":
            $('.compass').html(data.heading);
            $("#compass1").attr("viewBox", (data.heading - 90) + ' 0 180 5');
            $("#compass2").attr("viewBox", (data.heading - 90) + ' 0 180 1.5');
            break;
    }
});