$(document).ready(function() {
    // Filter Input fields that can only be numeric values.
    var originalValue = "";
    $(".numbers-only").keypress(function (event) {
        originalValue = $(this).val();
        console.log("keypressed, original value: " + originalValue);
    });
    $(".numbers-only").keyup(function (event) {
        var newValue = $(this).val();
        if (newValue.length != 0) {
            var valueAdded = newValue.substring(originalValue.length, newValue.length);
            console.log("keyup, value added: " + valueAdded);
            if (!parseInt(valueAdded)) {
                $(this).val(originalValue);
            }
        }
        console.log("keyup, original value: " + originalValue +" new value: " + newValue);
        originalValue = "";
    });
});