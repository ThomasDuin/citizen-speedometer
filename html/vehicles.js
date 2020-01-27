
$(function () {
    $("body").hide();
    window.addEventListener('message', function (event) {
        $("body").show();
        $.get('http://speed-o-meter/currentSpeed', function (data) {
            $("#pin-speed").css('transform', 'rotate(' + data + 'deg');
        });

        $.get('http://speed-o-meter/currentRev', function (data) {
            $("#pin-tachometer").css('transform', 'rotate(' + data + 'deg');
        });

        $.get('http://speed-o-meter/currentGear', function (data) {
            $("#gear").text(data)
        });

        $.get('http://speed-o-meter/inVehicle', function (data) {
            if(data == false) {
                $("body").hide();
            }
        });
    }, false);
});