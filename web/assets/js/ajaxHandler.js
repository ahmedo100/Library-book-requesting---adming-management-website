let modifyBtn = $('.modifyBtn');
modifyBtn.click(function (e) {

    $.get($(this).val(),{},function (response) {
            console.log(response);
    });
});