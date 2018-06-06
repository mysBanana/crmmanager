function permissionshow() {
    $("[permissionerequier]").each(function (index,item) {
        let permissionValue=$(item).attr('permissionerequier')
        $.get('/permission/isThisRolesPermission',
            {permissionValue:permissionValue},
            function (res) {
                if(!res.success){
                    $(item).hide();
                }
            },"json")
    })
}
