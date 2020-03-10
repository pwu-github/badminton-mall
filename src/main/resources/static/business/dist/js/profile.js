$(function () {
    var swlMessage = '修改成功';
    //修改个人信息
    $('#updateUserNameButton').click(function () {
        $("#updateUserNameButton").attr("disabled",true);
        var userName = $('#loginUserName').val();
        var nickName = $('#nickName').val();
        if (validUserNameForUpdate(userName, nickName)) {
            //ajax提交数据
            var params = $("#userNameForm").serialize();
            $.ajax({
                type: "POST",
                url: "/business/profile/name",
                data: params,
                success: function (r) {
                    console.log(r);
                    if (r == 'success') {
                        swal({
                            title: swlMessage,
                            type: 'success',
                            showCancelButton: false,
                            confirmButtonColor: '#1baeae',
                            // confirmButtonText: '返回商品列表',
                            confirmButtonClass: 'btn btn-success',
                            buttonsStyling: false
                        })
                    } else {
                        alert('修改失败');
                    }
                }
            });
        }
    });
    //修改密码
    $('#updatePasswordButton').click(function () {
        $("#updatePasswordButton").attr("disabled",true);
        var originalPassword = $('#originalPassword').val();
        var newPassword = $('#newPassword').val();
        if (validPasswordForUpdate(originalPassword, newPassword)) {
            var params = $("#userPasswordForm").serialize();
            $.ajax({
                type: "POST",
                url: "/business/profile/password",
                data: params,
                success: function (r) {
                    console.log(r);
                    if (r == 'success') {
                        swal({
                            title: swlMessage,
                            type: 'success',
                            showCancelButton: false,
                            confirmButtonColor: '#1baeae',
                            // confirmButtonText: '返回商品列表',
                            confirmButtonClass: 'btn btn-success',
                            buttonsStyling: false
                        }).then(function () {
                            window.location.href = '/business/login';
                        })

                    } else {
                        // swal('修改失败');
                    }
                }
            });
        }
    });
})

/**
 * 名称验证
 */
function validUserNameForUpdate(userName, nickName) {
    if (isNull(userName) || userName.trim().length < 1) {
        $('#updateUserName-info').css("display", "block");
        $('#updateUserName-info').html("请输入登陆名称！");
        return false;
    }
    if (isNull(nickName) || nickName.trim().length < 1) {
        $('#updateUserName-info').css("display", "block");
        $('#updateUserName-info').html("昵称不能为空！");
        return false;
    }
    if (!validUserName(userName)) {
        $('#updateUserName-info').css("display", "block");
        $('#updateUserName-info').html("请输入符合规范的登录名！");
        return false;
    }
    if (!validCN_ENString2_18(nickName)) {
        $('#updateUserName-info').css("display", "block");
        $('#updateUserName-info').html("请输入符合规范的昵称！");
        return false;
    }
    return true;
}

/**
 * 密码验证
 */
function validPasswordForUpdate(originalPassword, newPassword) {
    if (isNull(originalPassword) || originalPassword.trim().length < 1) {
        $('#updatePassword-info').css("display", "block");
        $('#updatePassword-info').html("请输入原密码！");
        return false;
    }else if (isNull(newPassword) || newPassword.trim().length < 1) {
        $('#updatePassword-info').css("display", "block");
        $('#updatePassword-info').html("新密码不能为空！");
        return false;
    }else if (!validPassword(newPassword)) {
        $('#updatePassword-info').css("display", "block");
        $('#updatePassword-info').html("请输入符合规范的密码！");
        return false;
    }else {
        $('#updatePassword-info').css("display", "block");
        $('#updatePassword-info').html("请检查原密码是否正确！");
    }
    return true;
}
